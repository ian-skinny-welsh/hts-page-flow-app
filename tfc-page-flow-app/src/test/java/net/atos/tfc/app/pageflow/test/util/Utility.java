package net.atos.tfc.app.pageflow.test.util;

import net.atos.tfc.app.pageflow.test.generate.Row;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Utility {

    private Utility() {
    }

    public static Map<String, List<Row>> groupByAction(List<Row> rows)
    {
        return rows
                .stream()
                .filter(r-> ""!=r.getRule())
                .collect(Collectors.groupingBy(Row::getAction));
    }

    public static String tagString(String string)
    {
        return string.replaceAll(" ", "_").toLowerCase();
    }
}
