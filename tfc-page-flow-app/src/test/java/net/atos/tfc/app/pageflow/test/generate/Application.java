package net.atos.tfc.app.pageflow.test.generate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.sql.DataSource;
import java.nio.file.Path;
import java.nio.file.Paths;

@SpringBootApplication
public class Application implements CommandLineRunner
{

    public static void main(String[] args)
    {
        SpringApplication.run(Application.class, args);
    }

    @Autowired
    private DataSource dataSource;

    @Override
    public void run(String... args) throws Exception
    {
        TestGenerator gt = new TestGenerator();

        Path currentDir = Paths.get("tfc-page-flow-app");
        Path testResources = currentDir.resolve("src").resolve("test").resolve("resources");

        gt.setBaseDirectory(testResources.resolve("features").toAbsolutePath().toString());
        gt.setPageFlowSQLPath(testResources.resolve("cfg_page_flow.sql").toAbsolutePath().toString());
        gt.setFeatureTemplate("template.feature");
        gt.setTemplateDirectory(testResources.toAbsolutePath().toString());
        gt.setGraphDirectory(testResources.resolve("graph").toAbsolutePath().toString());

        gt.setDataSource(dataSource);
        gt.generate();

    }
}
