Feature: Is the CIC Parent Account /par/app/workstartdatepartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/workstartdatepartner"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfStartDateIsMoreThan14DaysInFuture | NEXT | CIC Parent Account | /par/app/exit |
    | IfStartDateIsMoreThan14DaysInFuture | NEXT | CIC Parent Account | /par/app/exit |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Account | /par/app/partnerselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Account | /par/app/partnerselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Account | /par/app/partnerselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Account | /par/app/partnerselfemploy |
    |  | NEXT | CIC Parent Account | /par/app/otherleavepaytypepartner |
    |  | NEXT | CIC Parent Account | /par/app/otherleavepaytypepartner |

Scenario: CIC Parent Account page /par/app/workstartdatepartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfStartDateIsMoreThan14DaysInFuture |
        | IfStartDateIsMoreThan14DaysInFuture |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |

