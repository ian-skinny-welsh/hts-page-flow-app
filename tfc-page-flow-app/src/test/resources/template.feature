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

<#assign var=statics['net.atos.tfc.pageflowtests.Utility'].groupByAction(rows)/>
<#list var as propName, propValue>
    <#if propValue?size != 0>
Scenario: The next page from website ${websiteName} with action ${propName} rules are ordered correctly
    Given the user has visited "${websiteName}" website
    And the user is on page "${propValue[0].uri}}"
    When the user clicks "${propName}"
    Then these rules are executed in order:
    <#list propValue as row>
        | ${row.rule} |
    </#list>

    </#if>
</#list>