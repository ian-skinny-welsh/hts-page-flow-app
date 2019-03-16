@parent_account
Feature: Is the Parent Account /par/acc/paypaye page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/acc/paypaye page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/paypaye"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | CANCELPMNT | Parent Account | /par/acc/childaccountsummary |
    | isOneOffPaymentToday | NEXT | Parent Account | /par/acc/payewarning |
    | isOneOffNonBusinessDay | NEXT | Parent Account | /par/acc/payewarningnonworking |
    |  | NEXT | Parent Account | /par/acc/nannypayeauthorised |

Scenario: Parent Account page /par/acc/paypaye with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/paypaye"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isOneOffPaymentToday |
        | isOneOffNonBusinessDay |

