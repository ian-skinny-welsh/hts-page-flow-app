Feature: Is the Parent Application /par/app/existingparentdetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/existingparentdetails"

Scenario Outline: The next page from website Parent Application is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | CHANGEDET | Parent Application | /par/app/changedetails |
    |  | CONTINUE | Parent Application | /par/app/country |

