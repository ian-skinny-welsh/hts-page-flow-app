Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/rolloutdob"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsRolloutAvailableForGivenAge | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |
    | IsRolloutAvailableForGivenAge | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |
    | IsRolloutAvailableForDisabledChildren | NEXT | CIC Parent Reg | /par/app/rolloutdisability |
    |  | NEXT | CIC Parent Reg | /par/app/rolloutmessage |

Scenario: CIC Parent Reg page /par/app/rolloutdob with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsRolloutAvailableForGivenAge |
        | IsRolloutAvailableForGivenAge |
        | IsRolloutAvailableForDisabledChildren |

