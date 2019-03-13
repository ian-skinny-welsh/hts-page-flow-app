@parent_account
Feature: Is the Parent Account /par/app/partnername page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/partnername page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/partnername"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | Parent Account | /par/app/partnerdob |

