@parent_application
Feature: Is the Parent Application /par/app/existingparentdetails page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/existingparentdetails page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/existingparentdetails"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | CHANGEDET | Parent Application | /par/app/changedetails |
    |  | CONTINUE | Parent Application | /par/app/country |

