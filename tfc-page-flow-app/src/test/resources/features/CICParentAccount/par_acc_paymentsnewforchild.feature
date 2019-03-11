Feature: Is the CIC Parent Account /par/acc/paymentsnewforchild page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/paymentsnewforchild"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | CANCELPMNT | CIC Parent Account | /par/acc/childaccountsummary |
    | isOneOffPaymentToday | NEXT | CIC Parent Account | /par/acc/oneoffpaywarning |
    | isOneOffNonBusinessDay | NEXT | CIC Parent Account | /par/acc/oneoffpaywarningnonworking |
    | isRegularPayment | NEXT | CIC Parent Account | /par/acc/parcreateregularpay/redirectpost |
    |  | NEXT | CIC Parent Account | /par/acc/parcreateoneoffpay/redirectpost |
    |  | PARHOME | CIC Parent Account | /par/acc/accounthomepage |

Scenario: CIC Parent Account page /par/acc/paymentsnewforchild with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isOneOffPaymentToday |
        | isOneOffNonBusinessDay |
        | isRegularPayment |

