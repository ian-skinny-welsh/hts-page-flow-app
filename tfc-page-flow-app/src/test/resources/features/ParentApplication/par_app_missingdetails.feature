Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/missingdetails"

Scenario Outline: The next page from website Parent Application is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | missingDetailsParentSection | NEXT | Parent Application | /par/app/existingparentdetails |
    | missingDetailsPartnerSection | NEXT | Parent Application | /par/app/haspartner |
    | missingDetailsChildSection | NEXT | Parent Application | /par/app/childsname |
    | missingDetailsChildrenSection | NEXT | Parent Application | /par/app/childrensummary |
    | missingDetailsChildrenSection | NEXT | Parent Application | /par/app/childrensummary |
    | missingDetailsEmploymentSection | NEXT | Parent Application | /par/app/parenttype |
    | missingDetailsEmploymentSection | NEXT | Parent Application | /par/app/parenttype |
    |  | NEXT | Parent Application | /par/app/declaration |

Scenario: Parent Application page /par/app/missingdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | missingDetailsParentSection |
        | missingDetailsPartnerSection |
        | missingDetailsChildSection |
        | missingDetailsChildrenSection |
        | missingDetailsChildrenSection |
        | missingDetailsEmploymentSection |
        | missingDetailsEmploymentSection |

