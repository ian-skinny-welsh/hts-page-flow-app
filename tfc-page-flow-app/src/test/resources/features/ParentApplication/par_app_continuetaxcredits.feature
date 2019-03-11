Feature: Is the Parent Application /par/app/continuetaxcredits page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/continuetaxcredits"

Scenario Outline: The next page from website Parent Application is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | Parent Application | /par/app/parenttype |
    |  | NEXT | Parent Application | /par/app/parenttype |

