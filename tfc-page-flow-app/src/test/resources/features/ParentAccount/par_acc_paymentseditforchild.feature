@parent_account
Feature: Is the Parent Account /par/acc/paymentseditforchild page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/acc/paymentseditforchild page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/paymentseditforchild"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | CANCELPMNT | Parent Account | /par/acc/childaccountsummary |
    | isOneOffPaymentToday | NEXT | Parent Account | /par/acc/oneoffpaywarning |
    | isOneOffNonBusinessDay | NEXT | Parent Account | /par/acc/oneoffpaywarningnonworking |
    | isRegularPayment | NEXT | Parent Account | /par/acc/pareditregularpay/redirectpost |
    |  | NEXT | Parent Account | /par/acc/parcreateoneoffpay/redirectpost |
    |  | PARHOME | Parent Account | /par/acc/accounthomepage |

Scenario: Parent Account page /par/acc/paymentseditforchild with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/paymentseditforchild"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isOneOffPaymentToday |
        | isOneOffNonBusinessDay |
        | isRegularPayment |

