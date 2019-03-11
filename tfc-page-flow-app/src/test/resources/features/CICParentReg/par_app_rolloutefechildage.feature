Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/rolloutefechildage"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsNoneOfChildBornInScopeOfTime | NEXT | CIC Parent Reg | /par/app/rolloutefewarning |
    |  | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |
    |  | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |

Scenario: CIC Parent Reg page /par/app/rolloutefechildage with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsNoneOfChildBornInScopeOfTime |

