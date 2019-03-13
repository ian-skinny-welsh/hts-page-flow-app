@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/benefits page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/benefits page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/benefits"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | OnlySelectedNoneOfTheseBenefitsAndOrUnviersalCardCredit | NEXT | CIC Parent Reg | /par/app/parenttype |
    | SelectedChildcareBursariesOrGrantsButNotEligibleForDFE | NEXT | CIC Parent Reg | /par/app/exit |
    | OnlySelectedTaxCreditsButNotEligibleForDFE | NEXT | CIC Parent Reg | /par/app/taxcreditswarning |
    | IfEligibleForDFEAndSelectedTaxCreditsButNotChildcareVouchers | NEXT | CIC Parent Reg | /par/app/taxcredits |
    | IfSelectedChildcareVouchers | NEXT | CIC Parent Reg | /par/app/registeredschemes |
    |  | NEXT | CIC Parent Reg | /par/app/parenttype |

Scenario: CIC Parent Reg page /par/app/benefits with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/benefits"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | OnlySelectedNoneOfTheseBenefitsAndOrUnviersalCardCredit |
        | SelectedChildcareBursariesOrGrantsButNotEligibleForDFE |
        | OnlySelectedTaxCreditsButNotEligibleForDFE |
        | IfEligibleForDFEAndSelectedTaxCreditsButNotChildcareVouchers |
        | IfSelectedChildcareVouchers |

