Feature: Is the CIC Parent Reg /par/app/checklist page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/checklist"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsTrialFilterOff | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |
    | IsTrialFilterOff | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |
    | IsRollOutFiltersOff | NEXT | CIC Parent Reg | /par/app/trialdetailsentry |
    |  | NEXT | CIC Parent Reg | /par/app/invitedtotrial |

Scenario: CIC Parent Reg page /par/app/checklist with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsTrialFilterOff |
        | IsTrialFilterOff |
        | IsRollOutFiltersOff |

