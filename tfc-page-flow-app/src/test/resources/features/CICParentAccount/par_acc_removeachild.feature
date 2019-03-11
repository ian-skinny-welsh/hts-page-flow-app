Feature: Is the CIC Parent Account /par/acc/removeachild page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/removeachild"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfYesAndChildAccountHasNoFunds | NEXT | CIC Parent Account | /par/acc/childremovalconfirm |
    | IfYesAndParentHasBankDetails | NEXT | CIC Parent Account | /par/acc/childremovalsummary |
    | IfYes | NEXT | CIC Parent Account | /par/acc/childremovaldetailsentry |
    |  | NEXT | CIC Parent Account | /par/acc/accountsummary |

Scenario: CIC Parent Account page /par/acc/removeachild with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfYesAndChildAccountHasNoFunds |
        | IfYesAndParentHasBankDetails |
        | IfYes |

