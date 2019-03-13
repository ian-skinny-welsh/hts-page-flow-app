@parent_application
Feature: Is the Parent Application /par/app/holdingpage page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/holdingpage"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | AdultOrChildFailFirstGo | NEXT | Parent Application | /par/app/matchingfailure |
    | AdultOrChildFailSecondGoAndSecurityDone | NEXT | Parent Application | /par/app/survey |
    | AdultOrChildFailSecondGoAndSecurityNotDone | NEXT | Parent Application | /par/app/enterpassword |
    | AllAdultAndChildPassAndSecurityDone | NEXT | Parent Application | /par/app/survey |
    | AllAdultAndChildPassAndSecurityNotDone | NEXT | Parent Application | /par/app/enterpassword |
    | IfMaxAttemptsReachedAndSecurityDone | NEXT | Parent Application | /par/app/survey |
    | IfMaxAttemptsReachedAndSecurityNotDone | NEXT | Parent Application | /par/app/enterpassword |
    |  | NEXT | Parent Application | /par/app/holdingpage |

Scenario: Parent Application page /par/app/holdingpage with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | AdultOrChildFailFirstGo |
        | AdultOrChildFailSecondGoAndSecurityDone |
        | AdultOrChildFailSecondGoAndSecurityNotDone |
        | AllAdultAndChildPassAndSecurityDone |
        | AllAdultAndChildPassAndSecurityNotDone |
        | IfMaxAttemptsReachedAndSecurityDone |
        | IfMaxAttemptsReachedAndSecurityNotDone |

