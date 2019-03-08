package net.atos.tfc.pageflowtests;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import org.apache.commons.io.FileUtils;

public class GenerateTests
{
	private final EntityManagerFactory emf = Persistence.createEntityManagerFactory("tfc");

	private String baseDirectory;

	private Configuration cfg;

	private String pageFlowSQL;

	private String pageFlowSQLPath;

	private String featureTemplate;

	private String templateDirectory;

	public static void main(String[] args) throws Exception
	{
		try {
			GenerateTests gt = new GenerateTests();

			gt.setBaseDirectory("src/test/resources/features/");
			gt.setPageFlowSQLPath("src/main/resources/cfg_page_flow.sql");
			gt.setFeatureTemplate("template.feature");
			gt.setTemplateDirectory("src/test/resources");
			gt.generate();
		}
		finally {
			System.exit(0);
		}
	}

	public void generate() throws IOException, ParseException, MalformedTemplateNameException, TemplateException
	{

		cfg = new Configuration(Configuration.VERSION_2_3_27);
		pageFlowSQL = readSQL(pageFlowSQLPath);
		cfg.setDirectoryForTemplateLoading(new File(templateDirectory));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		cfg.setLogTemplateExceptions(false);
		cfg.setWrapUncheckedExceptions(true);

		List<Object[]> websites = emf.createEntityManager()
				.createNativeQuery("select website_id, name from CFG_WEBSITE")
				.getResultList();

		for (Object[] website : websites)
		{
			processWebsite(Integer.parseInt(website[0].toString()), website[1].toString());
		}
	}

	public void processWebsite(int websiteID, String websiteName)
			throws ParseException, IOException, MalformedTemplateNameException, TemplateException
	{

		List<Object[]> results = emf.createEntityManager()
				.createNativeQuery(pageFlowSQL)
				.setParameter("website_id", websiteID)
				.getResultList();

		Map<String, List<Row>> rowsMap = results
				.stream()
				.map(row -> createRow(row))
				.collect(Collectors.groupingBy(Row::getFromNameNoSpaces));

		for (String fromName : rowsMap.keySet())
		{
			generateFeatues(websiteID, rowsMap.get(fromName), fromName, websiteName);
		}
	}

	public void generateFeatues(int websiteID, List<Row> rows, String fromName, String websiteName)
		throws IOException, TemplateException
	{
		Template temp = cfg.getTemplate(featureTemplate);

		Path dirPathObj = Paths.get(baseDirectory + websiteName.replace(" ", ""));
		if ( ! Files.exists(dirPathObj) ) {
			Files.createDirectories(dirPathObj);
		}

		String pageName = fromName.replaceAll(" ", "_").replaceAll("/", "_");

		try (FileOutputStream fileOutputStream = new FileOutputStream(
				dirPathObj.toString() + "/"+ pageName +".feature"))
		{
			Writer out = new OutputStreamWriter(fileOutputStream);

			Map<String, Object> root = new HashMap<>();
			root.put("websiteName", websiteName);
			root.put("rows", rows);
			temp.process(root, out);
		}
	}

	public static String readSQL(String sqlFile) throws IOException
	{

		String sqlSource = FileUtils.readFileToString(new File(sqlFile), "UTF-8");
		return sqlSource.replaceAll("(\\r|\\n|\\r\\n)+", " ");
	}

	private Row createRow(Object[] result)
	{
		Row row = new Row();
		row.setWebsiteID(result[0] != null ? result[0].toString() : "");
		row.setUri(result[1] != null ? result[1].toString() : "");
		row.setFromName(result[2] != null ? result[2].toString() : "");
		row.setToID(result[3] != null ? result[3].toString() : "");
		row.setToName(result[4] != null ? result[4].toString() : "");
		row.setOption(result[5] != null ? result[5].toString() : "");
		row.setRule(result[6] != null ? result[6].toString() : "");
		row.setAction(result[7] != null ? result[7].toString() : "");
		row.setFromWebsite(result[8] != null ? result[8].toString() : "");
		row.setToWebsite(result[8] != null ? result[8].toString() : "");
		row.setToURI(result[9] != null ? result[9].toString() : "");
		return row;
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
}
