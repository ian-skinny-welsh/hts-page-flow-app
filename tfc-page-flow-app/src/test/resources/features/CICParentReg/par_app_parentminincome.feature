Feature: Is the CIC Parent Reg /par/app/parentminincome page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/parentminincome"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromParentMinIncomeToMaxPayThreshold | NEXT | CIC Parent Reg | /par/app/maxpaythreshold |
    | NavFromParentMinIncomeToPartnerMinIncome | NEXT | CIC Parent Reg | /par/app/partnerminincome |
    | NavFromParentMinIncomeToExit | NEXT | CIC Parent Reg | /par/app/exit |
    | NavFromParentMinIncomeToApprenticeMinPay | NEXT | CIC Parent Reg | /par/app/apprenticeminpay |
    | NavFromParentMinIncomeToApprenticeMinPay | NEXT | CIC Parent Reg | /par/app/apprenticeminpay |

Scenario: CIC Parent Reg page /par/app/parentminincome with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromParentMinIncomeToMaxPayThreshold |
        | NavFromParentMinIncomeToPartnerMinIncome |
        | NavFromParentMinIncomeToExit |
        | NavFromParentMinIncomeToApprenticeMinPay |
        | NavFromParentMinIncomeToApprenticeMinPay |

