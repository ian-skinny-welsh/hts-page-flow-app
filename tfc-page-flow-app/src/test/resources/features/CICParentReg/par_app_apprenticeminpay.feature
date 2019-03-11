@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/apprenticeminpay page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/apprenticeminpay"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromApprenticeMinPayToMaxPayThreshold | NEXT | CIC Parent Reg | /par/app/maxpaythreshold |
    | NavFromApprenticeMinPayToMaxPayThreshold | NEXT | CIC Parent Reg | /par/app/maxpaythreshold |
    | NavFromApprenticeMinPayToPartnerMinIncome | NEXT | CIC Parent Reg | /par/app/partnerminincome |
    | NavFromApprenticeMinPayToPartnerMinIncome | NEXT | CIC Parent Reg | /par/app/partnerminincome |
    | NavFromApprenticeMinPayToExit | NEXT | CIC Parent Reg | /par/app/exit |
    | NavFromApprenticeMinPayToExit | NEXT | CIC Parent Reg | /par/app/exit |

Scenario: CIC Parent Reg page /par/app/apprenticeminpay with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromApprenticeMinPayToMaxPayThreshold |
        | NavFromApprenticeMinPayToMaxPayThreshold |
        | NavFromApprenticeMinPayToPartnerMinIncome |
        | NavFromApprenticeMinPayToPartnerMinIncome |
        | NavFromApprenticeMinPayToExit |
        | NavFromApprenticeMinPayToExit |

