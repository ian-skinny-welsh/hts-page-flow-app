@parent_account
Feature: Is the Parent Account /par/acc/nannyemployedby page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/acc/nannyemployedby page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/nannyemployedby"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsCCPNannyEmployedByYou | NEXT | Parent Account | /par/acc/nannypayment |
    |  | NEXT | Parent Account | /par/acc/paymentsnewforchild |

Scenario: Parent Account page /par/acc/nannyemployedby with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/nannyemployedby"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsCCPNannyEmployedByYou |

