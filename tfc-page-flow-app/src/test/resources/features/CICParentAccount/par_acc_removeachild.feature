@cic_parent_account
Feature: Is the CIC Parent Account /par/acc/removeachild page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/acc/removeachild page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/removeachild"
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
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/removeachild"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfYesAndChildAccountHasNoFunds |
        | IfYesAndParentHasBankDetails |
        | IfYes |

