package net.atos.tfc.app.pageflow.test.util;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

import java.io.IOException;
import java.nio.file.Path;

public class TemplateFactory
{
    private Path rootDirectory;

    public TemplateFactory(Path rootDirectory)
    {
        this.rootDirectory = rootDirectory;
    }

    public Template createTemplate(String template)
    {
        try
        {
            Configuration cfg = new Configuration(Configuration.VERSION_2_3_27);
            cfg.setDirectoryForTemplateLoading(rootDirectory.toFile());
            cfg.setDefaultEncoding("UTF-8");
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            cfg.setLogTemplateExceptions(false);
            cfg.setWrapUncheckedExceptions(true);
            return cfg.getTemplate(template);
        }
        catch (IOException e)
        {
            throw new RuntimeException(e);
        }
    }
}
