package net.atos.tfc.app.pageflow.test.generate;

import freemarker.template.*;
import net.atos.tfc.app.pageflow.test.integration.PageFlowDriver;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static guru.nidi.graphviz.model.Factory.mutGraph;


public class FeatureFileGenerator
{

    private PageFlowDriver pageFlowDriver;
    private final Template template;
    private final Path outputDirectory;

    public FeatureFileGenerator(PageFlowDriver pageFlowDriver, Template template, Path outputDirectory)
    {
        this.pageFlowDriver = pageFlowDriver;
        this.template = template;
        this.outputDirectory = outputDirectory;
    }

    public void generate()
    {
        pageFlowDriver.getWebsites().forEach(this::processWebsite);
    }

    private void processWebsite(Website website)
    {
        Comparator<Row> rowComparator = Comparator.comparing(Row::getAction).thenComparing(Row::getOption);

        Map<String, List<Row>> rowsMap = pageFlowDriver.findPageFlows(website.getId())
                .stream()
                .sorted(rowComparator)
                .collect(Collectors.groupingBy(Row::getUri));

        rowsMap.forEach((uri,rows) -> generateFeatures(website, rows, uri));
    }

    private void generateFeatures(Website website, List<Row> rows, String fromName)
    {
        try
        {
            String groupingName = website.getName().replace(" ", "");
            Path dirPathObj = outputDirectory.resolve(groupingName);
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
                    dirPathObj.resolve(String.format("%s.feature",pageName)).toString()))
            {
                Writer out = new OutputStreamWriter(fileOutputStream);

                Map<String, Object> root = new HashMap<>();
                root.put("websiteName", website.getName());
                root.put("fromUri", fromName);
                root.put("rows", rows);
                root.put("statics", statics);

                template.process(root, out);
            }
        }
        catch (IOException | TemplateException e)
        {
            throw new RuntimeException(e);
        }
    }

}
