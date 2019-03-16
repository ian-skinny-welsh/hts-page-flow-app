@parent_application
Feature: Is the Parent Application /par/app/parentminincome page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/parentminincome page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parentminincome"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromParentMinIncomeToMaxPayThreshold | NEXT | Parent Application | /par/app/maxpaythreshold |
    | NavFromParentMinIncomeToPartnerMinIncome | NEXT | Parent Application | /par/app/partnerminincome |
    | NavFromParentMinIncomeToExit | NEXT | Parent Application | /par/app/exit |
    | NavFromParentMinIncomeToApprenticeMinPay | NEXT | Parent Application | /par/app/apprenticeminpay |

Scenario: Parent Application page /par/app/parentminincome with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parentminincome"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromParentMinIncomeToMaxPayThreshold |
        | NavFromParentMinIncomeToPartnerMinIncome |
        | NavFromParentMinIncomeToExit |
        | NavFromParentMinIncomeToApprenticeMinPay |

