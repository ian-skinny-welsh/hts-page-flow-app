Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/parentselfemployno"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAppliedForUTR | NEXT | CIC Parent Reg | /par/app/parentselfemployapplied |
    | IfAppliedForUTR | NEXT | CIC Parent Reg | /par/app/parentselfemployapplied |
    | IfAppliedForUTR | NEXT | CIC Parent Reg | /par/app/parentselfemployapplied |
    | IfAppliedForUTR | NEXT | CIC Parent Reg | /par/app/parentselfemployapplied |
    |  | NEXT | CIC Parent Reg | /par/app/exit |
    |  | NEXT | CIC Parent Reg | /par/app/exit |

Scenario: CIC Parent Reg page /par/app/parentselfemployno with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAppliedForUTR |
        | IfAppliedForUTR |
        | IfAppliedForUTR |
        | IfAppliedForUTR |

