@parent_account
Feature: Is the Parent Account /par/app/missingdetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/missingdetails"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | missingDetailsParentSection | NEXT | Parent Account | /par/app/country |
    | missingDetailsPartnerSection | NEXT | Parent Account | /par/app/haspartner |
    | missingDetailsChildSection | NEXT | Parent Account | /par/app/childsname |
    | missingDetailsChildSection | NEXT | Parent Account | /par/app/childsdetails |
    | missingDetailsChildrenSection | NEXT | Parent Account | /par/app/childrensummary |
    | missingDetailsEmploymentSection | NEXT | Parent Account | /par/app/parenttype |
    | missingDetailsEmploymentSection | NEXT | Parent Account | /par/app/parenttype |
    |  | NEXT | Parent Account | /par/app/declaration |

Scenario: Parent Account page /par/app/missingdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | missingDetailsParentSection |
        | missingDetailsPartnerSection |
        | missingDetailsChildSection |
        | missingDetailsChildSection |
        | missingDetailsChildrenSection |
        | missingDetailsEmploymentSection |
        | missingDetailsEmploymentSection |

