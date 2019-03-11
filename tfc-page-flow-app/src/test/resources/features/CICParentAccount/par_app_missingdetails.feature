Feature: Is the CIC Parent Account /par/app/missingdetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/missingdetails"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | missingDetailsParentSection | NEXT | CIC Parent Account | /par/app/country |
    | missingDetailsPartnerSection | NEXT | CIC Parent Account | /par/app/haspartner |
    | missingDetailsChildSection | NEXT | CIC Parent Account | /par/app/childsname |
    | missingDetailsChildSection | NEXT | CIC Parent Account | /par/app/childsdetails |
    | missingDetailsChildrenSection | NEXT | CIC Parent Account | /par/app/childrensummary |
    | missingDetailsChildrenSection | NEXT | CIC Parent Account | /par/app/childrensummary |
    | missingDetailsEmploymentSection | NEXT | CIC Parent Account | /par/app/parenttype |
    | missingDetailsEmploymentSection | NEXT | CIC Parent Account | /par/app/parenttype |
    |  | NEXT | CIC Parent Account | /par/app/declaration |

Scenario: CIC Parent Account page /par/app/missingdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | missingDetailsParentSection |
        | missingDetailsPartnerSection |
        | missingDetailsChildSection |
        | missingDetailsChildSection |
        | missingDetailsChildrenSection |
        | missingDetailsChildrenSection |
        | missingDetailsEmploymentSection |
        | missingDetailsEmploymentSection |

