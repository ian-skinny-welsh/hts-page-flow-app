@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/missingdetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/missingdetails"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | missingDetailsParentSection | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |
    | missingDetailsParentSection | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |
    | missingDetailsPartnerSection | NEXT | CIC Parent Reg | /par/app/haspartner |
    | missingDetailsChildSection | NEXT | CIC Parent Reg | /par/app/childsdetails |
    | missingDetailsChildrenSection | NEXT | CIC Parent Reg | /par/app/childrensummary |
    | missingDetailsChildrenSection | NEXT | CIC Parent Reg | /par/app/childrensummary |
    | missingDetailsEmploymentSection | NEXT | CIC Parent Reg | /par/app/parenttype |
    | missingDetailsEmploymentSection | NEXT | CIC Parent Reg | /par/app/parenttype |
    |  | NEXT | CIC Parent Reg | /par/app/declaration |

Scenario: CIC Parent Reg page /par/app/missingdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | missingDetailsParentSection |
        | missingDetailsParentSection |
        | missingDetailsPartnerSection |
        | missingDetailsChildSection |
        | missingDetailsChildrenSection |
        | missingDetailsChildrenSection |
        | missingDetailsEmploymentSection |
        | missingDetailsEmploymentSection |

