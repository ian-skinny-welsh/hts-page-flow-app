@parent_account
Feature: Is the Parent Account /par/acc/removeachild page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/acc/removeachild page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/removeachild"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfYesAndChildAccountHasNoFunds | NEXT | Parent Account | /par/acc/childremovalconfirm |
    | IfYesAndParentHasBankDetails | NEXT | Parent Account | /par/acc/childremovalsummary |
    | IfYes | NEXT | Parent Account | /par/acc/childremovaldetailsentry |
    |  | NEXT | Parent Account | /par/acc/accountsummary |

Scenario: Parent Account page /par/acc/removeachild with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/removeachild"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfYesAndChildAccountHasNoFunds |
        | IfYesAndParentHasBankDetails |
        | IfYes |

