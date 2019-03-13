@cic_parent_account
Feature: Is the CIC Parent Account /par/app/apprenticeminpaypartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/apprenticeminpaypartner page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/apprenticeminpaypartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NavFromPartnerApprenticeMinPayToExit | NEXT | CIC Parent Account | /par/app/exit |
    | NavFromPartnerApprenticeMinPayToMaxPayThreshold | NEXT | CIC Parent Account | /par/app/maxpaythreshold |

Scenario: CIC Parent Account page /par/app/apprenticeminpaypartner with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/apprenticeminpaypartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NavFromPartnerApprenticeMinPayToExit |
        | NavFromPartnerApprenticeMinPayToMaxPayThreshold |

