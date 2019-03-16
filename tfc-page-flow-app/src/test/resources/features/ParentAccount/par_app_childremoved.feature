@parent_account
Feature: Is the Parent Account /par/app/childremoved page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/childremoved page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/childremoved"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfNoChildrenOnSummary | NEXT | Parent Account | /par/acc/accounthomepage |
    |  | NEXT | Parent Account | /par/app/childrensummary |

Scenario: Parent Account page /par/app/childremoved with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/childremoved"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfNoChildrenOnSummary |

