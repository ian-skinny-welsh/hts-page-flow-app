@cic_parent_account
Feature: Is the CIC Parent Account /par/app/partnerminincome page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/partnerminincome"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromPartnerMinIncomeToMaxPayThreshold | NEXT | CIC Parent Account | /par/app/maxpaythreshold |
    | NavFromPartnerMinIncomeToExit | NEXT | CIC Parent Account | /par/app/exit |
    | NavFromPartnerMinIncomeToPartnerApprenticeMinPay | NEXT | CIC Parent Account | /par/app/apprenticeminpaypartner |
    | NavFromPartnerMinIncomeToPartnerApprenticeMinPay | NEXT | CIC Parent Account | /par/app/apprenticeminpaypartner |

Scenario: CIC Parent Account page /par/app/partnerminincome with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromPartnerMinIncomeToMaxPayThreshold |
        | NavFromPartnerMinIncomeToExit |
        | NavFromPartnerMinIncomeToPartnerApprenticeMinPay |
        | NavFromPartnerMinIncomeToPartnerApprenticeMinPay |

