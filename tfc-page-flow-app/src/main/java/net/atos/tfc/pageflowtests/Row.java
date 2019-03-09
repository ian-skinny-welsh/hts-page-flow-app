package net.atos.tfc.pageflowtests;

public class Row
{

	private String websiteID;
	private String fromName;
	private String uri;
	private String toURI;
	private String option;
	private String rule;
	private String toName;
	private String toID;
	private String action;
	private String fromWebsite;
	private String toWebsite;

	public String getFromNameNoSpaces() {
		return fromName != null ? fromName.replace(" ", "_") : null;
	}

	public String getFromName()
	{
		return fromName;
	}

	public void setFromName(String fromName)
	{
		this.fromName = fromName;
	}

	public String getOption()
	{
		return option;
	}

	public void setOption(String option)
	{
		this.option = option;
	}

	public Integer getOptionI()	{return Integer.valueOf(option);}

	public String getRule()
	{
		return rule;
	}

	public void setRule(String rule)
	{
		this.rule = rule;
	}

	public String getToName()
	{
		return toName;
	}

	public void setToName(String toName)
	{
		this.toName = toName;
	}

	public String getWebsiteID()
	{
		return websiteID;
	}

	public void setWebsiteID(String websiteID)
	{
		this.websiteID = websiteID;
	}

	public String getUri()
	{
		return uri;
	}

	public void setUri(String uri)
	{
		this.uri = uri;
	}

	public String getToID()
	{
		return toID;
	}

	public void setToID(String toID)
	{
		this.toID = toID;
	}

	public String getAction()
	{
		return action;
	}

	public void setAction(String action)
	{
		this.action = action;
	}

	public String getFromWebsite()
	{
		return fromWebsite;
	}

	public void setFromWebsite(String fromWebsite)
	{
		this.fromWebsite = fromWebsite;
	}

	public String getToWebsite()
	{
		return toWebsite;
	}

	public void setToWebsite(String toWebsite)
	{
		this.toWebsite = toWebsite;
	}

	public String getToURI()
	{
		return toURI;
	}

	public void setToURI(String toURI)
	{
		this.toURI = toURI;
	}

}
