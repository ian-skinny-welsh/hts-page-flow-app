@parent_account
Feature: Is the Parent Account /par/app/partnerminincome page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/partnerminincome page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/partnerminincome"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromPartnerMinIncomeToMaxPayThreshold | NEXT | Parent Account | /par/app/maxpaythreshold |
    | NavFromPartnerMinIncomeToExit | NEXT | Parent Account | /par/app/exit |
    | NavFromPartnerMinIncomeToPartnerApprenticeMinPay | NEXT | Parent Account | /par/app/apprenticeminpaypartner |

Scenario: Parent Account page /par/app/partnerminincome with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/partnerminincome"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromPartnerMinIncomeToMaxPayThreshold |
        | NavFromPartnerMinIncomeToExit |
        | NavFromPartnerMinIncomeToPartnerApprenticeMinPay |

