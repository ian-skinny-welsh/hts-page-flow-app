@parent_application
Feature: Is the Parent Application /par/app/apprenticeminpay page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/apprenticeminpay"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromApprenticeMinPayToMaxPayThreshold | NEXT | Parent Application | /par/app/maxpaythreshold |
    | NavFromApprenticeMinPayToMaxPayThreshold | NEXT | Parent Application | /par/app/maxpaythreshold |
    | NavFromApprenticeMinPayToPartnerMinIncome | NEXT | Parent Application | /par/app/partnerminincome |
    | NavFromApprenticeMinPayToPartnerMinIncome | NEXT | Parent Application | /par/app/partnerminincome |
    | NavFromApprenticeMinPayToExit | NEXT | Parent Application | /par/app/exit |
    | NavFromApprenticeMinPayToExit | NEXT | Parent Application | /par/app/exit |

Scenario: Parent Application page /par/app/apprenticeminpay with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromApprenticeMinPayToMaxPayThreshold |
        | NavFromApprenticeMinPayToMaxPayThreshold |
        | NavFromApprenticeMinPayToPartnerMinIncome |
        | NavFromApprenticeMinPayToPartnerMinIncome |
        | NavFromApprenticeMinPayToExit |
        | NavFromApprenticeMinPayToExit |

