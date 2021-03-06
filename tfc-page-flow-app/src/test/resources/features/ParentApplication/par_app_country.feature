@parent_application
Feature: Is the Parent Application /par/app/country page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/country page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/country"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsEnglandSelected | NEXT | Parent Application | /par/app/jointapplication |
    |  | NEXT | Parent Application | /par/app/parentnationality |

Scenario: Parent Application page /par/app/country with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/country"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsEnglandSelected |

