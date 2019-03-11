Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/apprenticeminpay"

Scenario Outline: The next page from website Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromApprenticeMinPayToMaxPayThreshold | NEXT | Parent Account | /par/app/maxpaythreshold |
    | NavFromApprenticeMinPayToMaxPayThreshold | NEXT | Parent Account | /par/app/maxpaythreshold |
    | NavFromApprenticeMinPayToPartnerMinIncome | NEXT | Parent Account | /par/app/partnerminincome |
    | NavFromApprenticeMinPayToPartnerMinIncome | NEXT | Parent Account | /par/app/partnerminincome |
    | NavFromApprenticeMinPayToExit | NEXT | Parent Account | /par/app/exit |
    | NavFromApprenticeMinPayToExit | NEXT | Parent Account | /par/app/exit |

Scenario: Parent Account page /par/app/apprenticeminpay with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromApprenticeMinPayToMaxPayThreshold |
        | NavFromApprenticeMinPayToMaxPayThreshold |
        | NavFromApprenticeMinPayToPartnerMinIncome |
        | NavFromApprenticeMinPayToPartnerMinIncome |
        | NavFromApprenticeMinPayToExit |
        | NavFromApprenticeMinPayToExit |

