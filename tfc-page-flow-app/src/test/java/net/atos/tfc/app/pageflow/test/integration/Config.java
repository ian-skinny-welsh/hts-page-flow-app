package net.atos.tfc.app.pageflow.test.integration;

import net.atos.tfc.app.pageflow.test.util.TemplateFactory;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
@EnableAutoConfiguration
public class Config
{

    @Bean
    public PageFlowDriver pageFlowDriver(DataSource dataSource)
    {
        Path currentDir = Paths.get("tfc-page-flow-app");
        Path scriptResources = currentDir.resolve("src").resolve("test").resolve("resources").resolve("scripts");

        return new PageFlowDriver(dataSource, scriptResources);
    }

    @Bean
    public TemplateFactory templateFactory()
    {
        Path currentDir = Paths.get("tfc-page-flow-app");
        Path testResources = currentDir.resolve("src").resolve("test").resolve("resources");

        return new TemplateFactory(testResources);
    }
}
