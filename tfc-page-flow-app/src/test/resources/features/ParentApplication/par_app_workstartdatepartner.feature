@parent_application
Feature: Is the Parent Application /par/app/workstartdatepartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/workstartdatepartner page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/workstartdatepartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfStartDateIsMoreThan14DaysInFuture | NEXT | Parent Application | /par/app/exit |
    | IfSelectedSelfEmployed | NEXT | Parent Application | /par/app/partnerselfemploy |
    |  | NEXT | Parent Application | /par/app/otherleavepaytypepartner |

Scenario: Parent Application page /par/app/workstartdatepartner with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/workstartdatepartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfStartDateIsMoreThan14DaysInFuture |
        | IfSelectedSelfEmployed |

