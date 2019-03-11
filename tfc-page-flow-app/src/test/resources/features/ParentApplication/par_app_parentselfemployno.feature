@parent_application
Feature: Is the Parent Application /par/app/parentselfemployno page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parentselfemployno"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAppliedForUTR | NEXT | Parent Application | /par/app/parentselfemployapplied |
    | IfAppliedForUTR | NEXT | Parent Application | /par/app/parentselfemployapplied |
    | IfAppliedForUTR | NEXT | Parent Application | /par/app/parentselfemployapplied |
    | IfAppliedForUTR | NEXT | Parent Application | /par/app/parentselfemployapplied |
    |  | NEXT | Parent Application | /par/app/exit |
    |  | NEXT | Parent Application | /par/app/exit |

Scenario: Parent Application page /par/app/parentselfemployno with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAppliedForUTR |
        | IfAppliedForUTR |
        | IfAppliedForUTR |
        | IfAppliedForUTR |

