package net.atos.tfc.app.pageflow.test.generate;

public class Website
{
    private Long id;
    private String name;

    public Website(Long id, String name)
    {
        this.id = id;
        this.name = name;
    }

    public Long getId()
    {
        return id;
    }

    public String getName()
    {
        return name;
    }
}
