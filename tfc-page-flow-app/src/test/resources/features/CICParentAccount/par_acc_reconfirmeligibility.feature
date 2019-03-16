@cic_parent_account
Feature: Is the CIC Parent Account /par/acc/reconfirmeligibility page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/acc/reconfirmeligibility page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/reconfirmeligibility"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | AppNotStoppedVouchers | NEXT | CIC Parent Account | /par/acc/notstoppedvouchers |
    |  | NEXT | CIC Parent Account | /par/app/declaration |

Scenario: CIC Parent Account page /par/acc/reconfirmeligibility with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/reconfirmeligibility"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | AppNotStoppedVouchers |

