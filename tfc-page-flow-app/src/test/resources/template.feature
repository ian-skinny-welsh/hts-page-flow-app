<#assign util=statics['net.atos.tfc.app.pageflow.test.util.Utility']/>
<#assign var=util.groupByAction(rows)/>
@${util.tagString(websiteName)}
Feature: Is the ${websiteName} ${fromUri} page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "${websiteName}" website
    And the user is on page "${fromUri}"

Scenario Outline: The next page from website ${websiteName} is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
<#list rows as row>
    | ${row.rule} | ${row.action} | ${row.toWebsite} | ${row.toURI} |
</#list>

<#list var as propName, propValue>
    <#if propValue?size != 0>
Scenario: ${websiteName} page ${fromUri} with action ${propName} rules are ordered correctly
    When the user clicks "${propName}"
    Then these rules are executed in order:
    <#list propValue as row>
        | ${row.rule} |
    </#list>

    </#if>
</#list>