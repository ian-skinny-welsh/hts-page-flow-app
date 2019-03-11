Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/parentminincome"

Scenario Outline: The next page from website Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromParentMinIncomeToMaxPayThreshold | NEXT | Parent Account | /par/app/maxpaythreshold |
    | NavFromParentMinIncomeToPartnerMinIncome | NEXT | Parent Account | /par/app/partnerminincome |
    | NavFromParentMinIncomeToExit | NEXT | Parent Account | /par/app/exit |
    | NavFromParentMinIncomeToApprenticeMinPay | NEXT | Parent Account | /par/app/apprenticeminpay |
    | NavFromParentMinIncomeToApprenticeMinPay | NEXT | Parent Account | /par/app/apprenticeminpay |

Scenario: Parent Account page /par/app/parentminincome with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromParentMinIncomeToMaxPayThreshold |
        | NavFromParentMinIncomeToPartnerMinIncome |
        | NavFromParentMinIncomeToExit |
        | NavFromParentMinIncomeToApprenticeMinPay |
        | NavFromParentMinIncomeToApprenticeMinPay |

