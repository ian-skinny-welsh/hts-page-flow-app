@parent_application
Feature: Is the Parent Application /par/app/partnerselfemployutr page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/partnerselfemployutr page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnerselfemployutr"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfHasUTR | NEXT | Parent Application | /par/app/partnerselfemployyes |
    |  | NEXT | Parent Application | /par/app/partnerselfemployno |

Scenario: Parent Application page /par/app/partnerselfemployutr with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnerselfemployutr"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfHasUTR |

