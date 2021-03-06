@cic_parent_account
Feature: Is the CIC Parent Account /par/app/parentminincome page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/parentminincome page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/parentminincome"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromParentMinIncomeToMaxPayThreshold | NEXT | CIC Parent Account | /par/app/maxpaythreshold |
    | NavFromParentMinIncomeToPartnerMinIncome | NEXT | CIC Parent Account | /par/app/partnerminincome |
    | NavFromParentMinIncomeToExit | NEXT | CIC Parent Account | /par/app/exit |
    | NavFromParentMinIncomeToApprenticeMinPay | NEXT | CIC Parent Account | /par/app/apprenticeminpay |

Scenario: CIC Parent Account page /par/app/parentminincome with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/parentminincome"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromParentMinIncomeToMaxPayThreshold |
        | NavFromParentMinIncomeToPartnerMinIncome |
        | NavFromParentMinIncomeToExit |
        | NavFromParentMinIncomeToApprenticeMinPay |

