package net.atos.tfc.app.pageflow.test.generate;

import freemarker.template.Template;
import net.atos.tfc.app.pageflow.test.integration.Config;
import net.atos.tfc.app.pageflow.test.integration.PageFlowDriver;
import net.atos.tfc.app.pageflow.test.util.TemplateFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import java.nio.file.Path;
import java.nio.file.Paths;

@SpringBootApplication
@Import(Config.class)
public class FeatureApplication implements CommandLineRunner
{
    @Autowired
    private TemplateFactory templateFactory;

    @Autowired
    private PageFlowDriver pageFlowDriver;

    public static void main(String[] args)
    {
        SpringApplication.run(FeatureApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception
    {
        Path currentDir = Paths.get("tfc-page-flow-app");
        Path outputDirectory = currentDir.resolve("src").resolve("test").resolve("resources").resolve("features").toAbsolutePath();

        Template template = templateFactory.createTemplate("feature.ftl");
        FeatureFileGenerator testGenerator = new FeatureFileGenerator(pageFlowDriver, template, outputDirectory);

        testGenerator.generate();
    }
}
