Feature: Is the page correct?
  Is the correct page returned

Scenario Outline: The next page from website ${websiteName} is correctly displayed
    Given the user has visited "<fromWebsite>" website
    And the user is on page "<from url>"
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | fromWebsite | from url | rule | action | to website | to url |
<#list rows as row>
    | ${row.fromWebsite} | ${row.uri} | ${row.rule} | ${row.action} | ${row.toWebsite} | ${row.toURI} |
</#list>
