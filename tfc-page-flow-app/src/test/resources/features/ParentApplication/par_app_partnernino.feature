@parent_application
Feature: Is the Parent Application /par/app/partnernino page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/partnernino page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnernino"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | Parent Application | /par/app/partnersameaddress |

