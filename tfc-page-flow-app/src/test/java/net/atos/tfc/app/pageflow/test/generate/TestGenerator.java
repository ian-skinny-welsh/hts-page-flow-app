package net.atos.tfc.app.pageflow.test.generate;

import freemarker.core.ParseException;
import freemarker.template.*;
import guru.nidi.graphviz.attribute.*;
import guru.nidi.graphviz.attribute.GraphAttr.SplineMode;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.Graph;
import guru.nidi.graphviz.model.MutableGraph;
import net.atos.tfc.app.pageflow.test.util.PageFlowMapper;
import net.atos.tfc.app.pageflow.test.util.Sql;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.lang.Nullable;

import javax.sql.DataSource;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static guru.nidi.graphviz.model.Factory.*;

public class TestGenerator
{
	private static Logger LOGGER = LoggerFactory.getLogger(TestGenerator.class);

	private String baseDirectory;

	private Configuration cfg;

	private String pageFlowSQL;

	private String pageFlowSQLPath;

	private String featureTemplate;

	private String templateDirectory;
	private DataSource dataSource;
	private String graphDirectory;


	public void generate() throws IOException, ParseException, MalformedTemplateNameException, TemplateException
	{
		cfg = new Configuration(Configuration.VERSION_2_3_27);
		pageFlowSQL = Sql.readSQL(pageFlowSQLPath);
		cfg.setDirectoryForTemplateLoading(new File(templateDirectory));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		cfg.setLogTemplateExceptions(false);
		cfg.setWrapUncheckedExceptions(true);

		getWebsites().forEach(this::processWebsite);
	}

	private List<Website> getWebsites()
	{
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		return jdbcTemplate.query("select website_id, name from CFG_WEBSITE", new RowMapper<Website>()
		{
			@Nullable
			@Override
			public Website mapRow(ResultSet resultSet, int i) throws SQLException
			{
				return new Website(resultSet.getLong("website_id"), resultSet.getString("name"));
			}
		});
	}

	public void processWebsite(final Website website)
	{
		Comparator<Row> rowComparator = Comparator.comparing(Row::getAction).thenComparing(Row::getOptionI);

		Map<String, List<Row>> rowsMap = getPageFlows(website.getId())
				.stream()
				.sorted(rowComparator)
				.collect(Collectors.groupingBy(Row::getUri));

		rowsMap.forEach((uri,rows) -> generateFeatues(website, rows, uri));

		createWebsiteChart(website, rowsMap);
	}

	private void createWebsiteChart(Website website, Map<String, List<Row>> rowsMap)
	{
		MutableGraph g = mutGraph(website.getName()).setDirected(true)
				.graphAttrs()
					.add(RankDir.LEFT_TO_RIGHT)
				.use((gr, ctx) ->
			rowsMap.forEach((uri,rows)-> generateChart(website, rows, uri)));

		createGraphPng(website, g);
	}

	private void createGraphPng(Website website, MutableGraph g)
	{
		try
		{
			Graphviz
					.fromGraph(g)
					.height(1200)
					.render(Format.SVG)
					.toFile(new File(String.format("%s/%s.svg",graphDirectory,website.getName())));

		}
		catch (IOException e)
		{
			LOGGER.warn("",e);
		}
	}

	private void generateChart(Website website, List<Row> rows, String uri)
	{
		rows.forEach(r->
		{
			if("NEXT".equals(r.getAction())||"CONTINUE".equals(r.getAction()))
			{
				linkAttrs().add(Style.SOLID, Label.of(r.getRule()));
			}
			else
			{
				linkAttrs().add(Style.DASHED, Label.of(String.format("%s : %s",r.getAction(),r.getRule())));
			}

			graphAttrs().add("splines",SplineMode.POLYLINE.name());
			nodeAttrs().add(Shape.RECTANGLE);
			mutNode(uri).addLink(mutNode(r.getToURI()));
		});

	}

	private List<Row> getPageFlows(Long id)
	{
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		return jdbcTemplate.query(pageFlowSQL, new Object[] {id}, new PageFlowMapper());
	}

	public void generateFeatues(Website website, List<Row> rows, String fromName)
	{
		try
		{
			Template temp = cfg.getTemplate(featureTemplate);

			Path dirPathObj = Paths.get(baseDirectory+"/" + website.getName().replace(" ", ""));
			if (!Files.exists(dirPathObj))
			{
				Files.createDirectories(dirPathObj);
			}

			String pageName = fromName.replaceAll(" ", "_").replaceAll("/", "_");
			if (pageName.length() > 1 && "_".equals(pageName.substring(0, 1)))
			{
				pageName = pageName.replaceFirst("_", "");
			}

			DefaultObjectWrapper wrapper = new DefaultObjectWrapper(Configuration.VERSION_2_3_27);
			TemplateModel statics = wrapper.getStaticModels();

			try (FileOutputStream fileOutputStream = new FileOutputStream(
					dirPathObj.toString() + "/" + pageName + ".feature"))
			{
				Writer out = new OutputStreamWriter(fileOutputStream);

				Map<String, Object> root = new HashMap<>();
				root.put("websiteName", website.getName());
				root.put("fromUri", fromName);
				root.put("rows", rows);
				root.put("statics", statics);
				temp.process(root, out);

			}
		}
		catch (IOException | TemplateException e)
		{
			throw new RuntimeException(e);
		}
	}


	public String getBaseDirectory()
	{
		return baseDirectory;
	}

	public void setBaseDirectory(String baseDirectory)
	{
		this.baseDirectory = baseDirectory;
	}

	public String getFeatureTemplate()
	{
		return featureTemplate;
	}

	public void setFeatureTemplate(String featureTemplate)
	{
		this.featureTemplate = featureTemplate;
	}

	public String getPageFlowSQLPath()
	{
		return pageFlowSQLPath;
	}

	public void setPageFlowSQLPath(String pageFlowSQLPath)
	{
		this.pageFlowSQLPath = pageFlowSQLPath;
	}

	public String getTemplateDirectory()
	{
		return templateDirectory;
	}

	public void setTemplateDirectory(String templateDirectory)
	{
		this.templateDirectory = templateDirectory;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setGraphDirectory(String graphDirectory) {
		this.graphDirectory = graphDirectory;
	}

	public String getGraphDirectory() {
		return graphDirectory;
	}
}
