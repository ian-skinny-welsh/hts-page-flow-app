package net.atos.tfc.app.pageflow.test.generate;

import net.atos.tfc.app.pageflow.test.integration.Config;
import net.atos.tfc.app.pageflow.test.integration.PageFlowDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import java.nio.file.Path;
import java.nio.file.Paths;

@SpringBootApplication
@Import(Config.class)
public class ChartApplication implements CommandLineRunner
{
    @Autowired
    private PageFlowDriver pageFlowDriver;

    public static void main(String[] args)
    {
        SpringApplication.run(ChartApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception
    {
        Path currentDir = Paths.get("tfc-page-flow-app");
        Path outputDirectory = currentDir.resolve("src").resolve("test").resolve("resources").resolve("graph").toAbsolutePath();

        ChartGenerator chartGenerator = new ChartGenerator(pageFlowDriver,outputDirectory);
        chartGenerator.generate();
    }
}
