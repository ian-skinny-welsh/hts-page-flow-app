package net.atos.tfc.app.pageflow.test.generate;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class Row
{

	private Long websiteID;
	private String fromName;
	private String uri;
	private String toURI;
	private Long option;
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

	public Long getOption()
	{
		return option;
	}

	public void setOption(Long option)
	{
		this.option = option;
	}

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

	public Long getWebsiteID()
	{
		return websiteID;
	}

	public void setWebsiteID(Long websiteID)
	{
		this.websiteID = websiteID;
	}

	public String getUri()
	{
		return uri;
	}

	public void setFromUri(String uri)
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

	public String toString()
	{
		return ToStringBuilder.reflectionToString(this);
	}
}
