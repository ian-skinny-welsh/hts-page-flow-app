package net.atos.tfc.app.pageflow.test.generate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.sql.DataSource;

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

        gt.setBaseDirectory("/appl/git/tfc-page-flow-app/tfc-page-flow-app/src/test/resources/features/");
        gt.setPageFlowSQLPath("/appl/git/tfc-page-flow-app/tfc-page-flow-app/src/test/resources/cfg_page_flow.sql");
        gt.setFeatureTemplate("template.feature");
        gt.setTemplateDirectory("/appl/git/tfc-page-flow-app/tfc-page-flow-app/src/test/resources");
        gt.setGraphDirectory("/appl/git/tfc-page-flow-app/tfc-page-flow-app/src/test/resources/graph");

        gt.setDataSource(dataSource);
        gt.generate();

    }
}
