package pageflow;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import net.atos.tfc.pageflowtests.GenerateTests;
import static org.hamcrest.CoreMatchers.hasItem;
import static org.hamcrest.MatcherAssert.assertThat;

public class Stepdefs
{
	static EntityManager entityManager = Persistence.createEntityManagerFactory("tfc").createEntityManager();

	private String fromWebsite;

	private String fromWebsiteID;

	private String fromPage;

	private String rule;

	private String action;

	private String toWebsite;

	private List<String> nextPages = new ArrayList<>();

	@Given("^the user has visited \"([^\"]*)\" website$")
	public void the_user_has_visited_website(String fromWebsite) throws Exception {
		this.fromWebsite = fromWebsite;
		fromWebsiteID = entityManager.createNativeQuery("SELECT website_id FROM CFG_WEBSITE where name = :name")
				.setParameter("name", fromWebsite)
				.getSingleResult().toString();
	}

	@Given("^the user is on page \"([^\"]*)\"$")
	public void the_user_is_on_page(String fromPage) throws Exception {
		this.fromPage = fromPage;
	}

	@Given("^the rule \"([^\"]*)\" succeeds$")
	public void the_rule_succeeds(String rule) throws Exception {
		this.rule = rule;
	}

	@When("^the user clicks \"([^\"]*)\"$")
	public void the_user_clicks(String action) throws Exception {


		String sql = GenerateTests.readSQL("src/test/resources/when.sql");
		List<Object[]> results = entityManager
				.createNativeQuery(sql)
				.setParameter("website_id", fromWebsiteID)
				.setParameter("action", action)
				.getResultList();

		results.forEach((result) -> {
			nextPages.add(result[9].toString());
		});
	}

	@Then("^the user is on \"([^\"]*)\" website$")
	public void the_user_is_on_website(String toWebsite) throws Exception {
		//
	}

	@Then("^the page \"([^\"]*)\" is displayed$")
	public void the_page_is_displayed(String nextPage) throws Exception {

		assertThat(nextPages, hasItem(nextPage));
	}
}
