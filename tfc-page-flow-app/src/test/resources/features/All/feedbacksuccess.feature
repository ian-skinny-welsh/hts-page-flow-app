@all
Feature: Is the All /feedbacksuccess page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from All /feedbacksuccess page is correctly displayed
    Given the user has visited "All" website
    And the user is on page "/feedbacksuccess"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | All | / |

