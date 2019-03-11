@cic_parent_account
Feature: Is the CIC Parent Account /par/app/holdingpage page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/holdingpage"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | AdultOrChildFailFirstGo | NEXT | CIC Parent Account | /par/app/matchingfailure |
    | AdultOrChildFailFirstGo | NEXT | CIC Parent Account | /par/app/matchingfailure |
    | IfReceivedAPI9Response | NEXT | CIC Parent Account | /par/app/survey |
    | IfMaxAttemptsReachedAndSecurityDone | NEXT | CIC Parent Account | /par/app/survey |
    | IfMaxAttemptsReachedAndSecurityNotDone | NEXT | CIC Parent Account | /par/app/survey |
    |  | NEXT | CIC Parent Account | /par/app/survey |

Scenario: CIC Parent Account page /par/app/holdingpage with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | AdultOrChildFailFirstGo |
        | AdultOrChildFailFirstGo |
        | IfReceivedAPI9Response |
        | IfMaxAttemptsReachedAndSecurityDone |
        | IfMaxAttemptsReachedAndSecurityNotDone |

