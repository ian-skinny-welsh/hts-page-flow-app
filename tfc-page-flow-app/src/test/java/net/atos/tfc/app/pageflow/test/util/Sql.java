package net.atos.tfc.app.pageflow.test.util;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;

public class Sql
{
    private Sql()
    {
    }

    public static String readSQL(String sqlFile)
    {
        try
        {
            String sqlSource = FileUtils.readFileToString(new File(sqlFile), "UTF-8");
            return sqlSource.replaceAll("(\\r|\\n|\\r\\n)+", " ");
        }
        catch (IOException e)
        {
            throw new RuntimeException(e);
        }
    }
}
