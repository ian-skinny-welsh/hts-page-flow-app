package net.atos.tfc.app.pageflow.test.integration;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import net.atos.tfc.app.pageflow.test.generate.Row;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static java.util.Optional.ofNullable;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.hasSize;
import static org.hamcrest.Matchers.is;

public class Stepdefs extends CucumberRoot
{
	private static Logger LOGGER = LoggerFactory.getLogger(Stepdefs.class);

	@Autowired
	private PageFlowDriver pageFlowDriver;

	private String fromWebsite;

	private Long fromWebsiteID;

	private String fromPage;

	private String rule;

	private String action;

	private List<Row> pageFlows;

	@Given("^the user has visited \"([^\"]*)\" website$")
	public void the_user_has_visited_website(String fromWebsite) throws Exception
	{
		this.fromWebsite = fromWebsite;
		fromWebsiteID = pageFlowDriver.getWebsiteId(fromWebsite);
	}

	@Given("^the user is on page \"([^\"]*)\"$")
	public void the_user_is_on_page(String fromPage) throws Exception
	{
		this.fromPage = fromPage;
	}

	@Given("^the rule \"([^\"]*)\" succeeds$")
	public void the_rule_succeeds(String rule) throws Exception
	{
		this.rule = ofNullable(rule).orElse("");
	}

	@When("^the user clicks \"([^\"]*)\"$")
	public void the_user_clicks(String action) throws Exception
	{
		fromWebsiteID = pageFlowDriver.getWebsiteId(fromWebsite);
		pageFlows = pageFlowDriver.findPageFlows(fromPage, fromWebsiteID, action);
	}

	@Then("^the user is on \"([^\"]*)\" website$")
	public void the_user_is_on_website(String toWebsite) throws Exception
	{
		List<Row> pageFlow = pageFlows.stream()
				.filter(p -> StringUtils.equals(rule, p.getRule()))
				.collect(Collectors.toList());

		if(pageFlow.size()>1)
		{
			pageFlow.forEach(p->
			{
				LOGGER.info("{}",p);
			});
		}
		assertThat(pageFlow, hasSize(1));
		assertThat(pageFlow.get(0).getToWebsite(), is(toWebsite));
	}

	@Then("^the page \"([^\"]*)\" is displayed$")
	public void the_page_is_displayed(String nextPageUri) throws Exception
	{
		List<Row> pageFlow = pageFlows.stream()
				.filter(p -> StringUtils.equals(rule, p.getRule()))
				.collect(Collectors.toList());

		assertThat(pageFlow, hasSize(1));
		assertThat(pageFlow.get(0).getToURI(), is(nextPageUri));
	}

	@Then("^these rules are executed in order:")
	public void these_rules_are_executed_in_order(List<String> rules)
	{
		List<String> expectedRules = pageFlows.stream()
				.sorted(Comparator.comparing(Row::getOptionI))
				.map(Row::getRule)
				.collect(Collectors.toList());
		expectedRules.removeAll(Arrays.asList("",null));

		assertThat(expectedRules, is(rules));
	}
}
