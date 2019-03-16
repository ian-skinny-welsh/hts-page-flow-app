package net.atos.tfc.app.pageflow.test;

import guru.nidi.graphviz.attribute.Color;
import guru.nidi.graphviz.attribute.RankDir;
import guru.nidi.graphviz.attribute.Style;
import guru.nidi.graphviz.engine.Format;
import guru.nidi.graphviz.engine.Graphviz;
import guru.nidi.graphviz.model.Graph;
import org.junit.Test;

import java.io.File;
import java.io.IOException;

import static guru.nidi.graphviz.model.Factory.*;

public class GraphTest
{

    public void testGraphviz() throws IOException
    {
        Graph g = graph("example1").directed()
            .graphAttr().with(RankDir.LEFT_TO_RIGHT)
            .with(
                node("a").with(Color.RED).link(node("b")),
                node("b").link(to(node("c")).with(Style.DASHED))
            );

        Graphviz
            .fromGraph(g)
            .height(100)
                .render(Format.PNG)
                .toFile(new File("target/graph/ex1.png"));
    }
}
