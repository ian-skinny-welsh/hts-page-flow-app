package net.atos.tfc.app.pageflow.test.generate;

import guru.nidi.graphviz.attribute.GraphAttr.SplineMode;
import guru.nidi.graphviz.attribute.Label;
import guru.nidi.graphviz.attribute.RankDir;
import guru.nidi.graphviz.attribute.Shape;
import guru.nidi.graphviz.attribute.Style;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.MutableGraph;
import net.atos.tfc.app.pageflow.test.integration.PageFlowDriver;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static guru.nidi.graphviz.model.Factory.*;

public class ChartGenerator
{
    private PageFlowDriver pageFlowDriver;
    private Path outputDirectory;

    public ChartGenerator(PageFlowDriver pageFlowDriver, Path outputDirectory)
    {
        this.pageFlowDriver = pageFlowDriver;
        this.outputDirectory = outputDirectory;
    }

    public void generate()
    {
        pageFlowDriver.getWebsites().forEach(this::processWebsite);
    }

    public void processWebsite(final Website website)
    {
        Map<String, List<Row>> rowsMap = pageFlowDriver.findPageFlows(website.getId())
                .stream()
                .collect(Collectors.groupingBy(Row::getUri));

        createWebsiteChart(website, rowsMap);
    }

    private void createWebsiteChart(Website website, Map<String, List<Row>> rowsMap)
    {
        MutableGraph g = mutGraph(website.getName()).setDirected(true)
                .graphAttrs()
                .add(RankDir.LEFT_TO_RIGHT)
                .use((gr, ctx) ->
                        rowsMap.forEach((uri,rows)-> generateChart(rows, uri)));

        createGraphSvg(website, g);
    }

    private void createGraphSvg(Website website, MutableGraph g)
    {
        try
        {
            Graphviz
                    .fromGraph(g)
                    .height(1200)
                    .render(Format.SVG)
                    .toFile(new File(outputDirectory.resolve(String.format("%s.svg", website.getName())).toString()));
        }
        catch (IOException e)
        {
            throw new RuntimeException(e);
        }
    }

    private static void generateChart(List<Row> rows, String uri)
    {
        rows.forEach(r->
        {
            if("NEXT".equals(r.getAction())||"CONTINUE".equals(r.getAction()))
            {
                linkAttrs().add(Style.SOLID, Label.of(r.getRule()));
            }
            else
            {
                linkAttrs().add(Style.DASHED, Label.of(String.format("%s : %s",r.getAction(),r.getRule())));
            }

            graphAttrs().add("splines", SplineMode.POLYLINE.name());
            nodeAttrs().add(Shape.RECTANGLE);
            mutNode(uri).addLink(mutNode(r.getToURI()));
        });
    }
}
