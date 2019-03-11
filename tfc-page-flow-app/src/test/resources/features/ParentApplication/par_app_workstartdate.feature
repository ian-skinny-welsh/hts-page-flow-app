Feature: Is the Parent Application /par/app/workstartdate page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/workstartdate"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfStartDateIsMoreThan14DaysInFuture | NEXT | Parent Application | /par/app/exit |
    | IfStartDateIsMoreThan14DaysInFuture | NEXT | Parent Application | /par/app/exit |
    | IfSelectedSelfEmployed | NEXT | Parent Application | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Application | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Application | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Application | /par/app/parentselfemploy |
    |  | NEXT | Parent Application | /par/app/otherleavepaytype |
    |  | NEXT | Parent Application | /par/app/otherleavepaytype |

Scenario: Parent Application page /par/app/workstartdate with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfStartDateIsMoreThan14DaysInFuture |
        | IfStartDateIsMoreThan14DaysInFuture |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |

