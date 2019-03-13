@parent_application
Feature: Is the Parent Application /par/app/parentselfemployutr page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/parentselfemployutr page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parentselfemployutr"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfHasUTR | NEXT | Parent Application | /par/app/parentselfemployyes |
    |  | NEXT | Parent Application | /par/app/parentselfemployno |

Scenario: Parent Application page /par/app/parentselfemployutr with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parentselfemployutr"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfHasUTR |

