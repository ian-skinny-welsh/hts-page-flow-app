@parent_account
Feature: Is the Parent Account /par/app/holdingpage page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/holdingpage page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/holdingpage"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | AdultOrChildFailFirstGo | NEXT | Parent Account | /par/app/matchingfailure |
    | AdultOrChildFailSecondGoAndSecurityDone | NEXT | Parent Account | /par/app/survey |
    | AllAdultAndChildPassAndSecurityDone | NEXT | Parent Account | /par/app/survey |
    | IfReceivedAPI9Response | NEXT | Parent Account | /par/app/survey |
    | IfMaxAttemptsReachedAndSecurityDone | NEXT | Parent Account | /par/app/survey |
    |  | NEXT | Parent Account | /par/app/holdingpage |

Scenario: Parent Account page /par/app/holdingpage with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/holdingpage"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | AdultOrChildFailFirstGo |
        | AdultOrChildFailSecondGoAndSecurityDone |
        | AllAdultAndChildPassAndSecurityDone |
        | IfReceivedAPI9Response |
        | IfMaxAttemptsReachedAndSecurityDone |

