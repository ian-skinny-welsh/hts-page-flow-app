package net.atos.tfc.app.pageflow.test.generate;

import freemarker.core.ParseException;
import freemarker.template.*;
import net.atos.tfc.app.pageflow.test.util.PageFlowMapper;
import net.atos.tfc.app.pageflow.test.util.Sql;
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

public class TestGenerator
{
	private String baseDirectory;

	private Configuration cfg;

	private String pageFlowSQL;

	private String pageFlowSQLPath;

	private String featureTemplate;

	private String templateDirectory;
	private DataSource dataSource;


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

			Path dirPathObj = Paths.get(baseDirectory + website.getName().replace(" ", ""));
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
}
