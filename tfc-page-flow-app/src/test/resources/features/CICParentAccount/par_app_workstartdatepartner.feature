@cic_parent_account
Feature: Is the CIC Parent Account /par/app/workstartdatepartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/workstartdatepartner page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/workstartdatepartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfStartDateIsMoreThan14DaysInFuture | NEXT | CIC Parent Account | /par/app/exit |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Account | /par/app/partnerselfemploy |
    |  | NEXT | CIC Parent Account | /par/app/otherleavepaytypepartner |

Scenario: CIC Parent Account page /par/app/workstartdatepartner with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/workstartdatepartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfStartDateIsMoreThan14DaysInFuture |
        | IfSelectedSelfEmployed |

