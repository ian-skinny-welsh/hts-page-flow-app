Feature: Is the Parent Account /par/acc/ccpselections page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/ccpselections"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | BACK | Parent Account | /par/acc/childaccountsummary |
    | IsEmptyList | NEXT | Parent Account | /par/acc/ccpselection |
    | AddCCPForAnotherChild | NEXT | Parent Account | /par/acc/addforanotherchild |
    |  | NEXT | Parent Account | /par/acc/childaccountsummary |

Scenario: Parent Account page /par/acc/ccpselections with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsEmptyList |
        | AddCCPForAnotherChild |

