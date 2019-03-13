@cic_parent_account
Feature: Is the CIC Parent Account /par/app/apprenticeminpay page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/apprenticeminpay"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromApprenticeMinPayToMaxPayThreshold | NEXT | CIC Parent Account | /par/app/maxpaythreshold |
    | NavFromApprenticeMinPayToPartnerMinIncome | NEXT | CIC Parent Account | /par/app/partnerminincome |
    | NavFromApprenticeMinPayToExit | NEXT | CIC Parent Account | /par/app/exit |

Scenario: CIC Parent Account page /par/app/apprenticeminpay with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromApprenticeMinPayToMaxPayThreshold |
        | NavFromApprenticeMinPayToPartnerMinIncome |
        | NavFromApprenticeMinPayToExit |

