@parent_application
Feature: Is the Parent Application /par/app/partnerminincome page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/partnerminincome page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnerminincome"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromPartnerMinIncomeToMaxPayThreshold | NEXT | Parent Application | /par/app/maxpaythreshold |
    | NavFromPartnerMinIncomeToExit | NEXT | Parent Application | /par/app/exit |
    | NavFromPartnerMinIncomeToPartnerApprenticeMinPay | NEXT | Parent Application | /par/app/apprenticeminpaypartner |

Scenario: Parent Application page /par/app/partnerminincome with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnerminincome"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromPartnerMinIncomeToMaxPayThreshold |
        | NavFromPartnerMinIncomeToExit |
        | NavFromPartnerMinIncomeToPartnerApprenticeMinPay |

