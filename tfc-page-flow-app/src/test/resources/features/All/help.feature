@all
Feature: Is the All /help page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "All" website
    And the user is on page "/help"

Scenario Outline: The next page from website All is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | All | / |

