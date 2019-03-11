package net.atos.tfc.pageflowtests;

import freemarker.template.utility.StringUtil;

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
