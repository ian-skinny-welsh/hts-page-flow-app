@parent_application
Feature: Is the Parent Application /par/app/benefits page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/benefits page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/benefits"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | OnlySelectedNoneOfTheseBenefitsAndOrUnviersalCardCredit | NEXT | Parent Application | /par/app/parenttype |
    | SelectedChildcareBursariesOrGrantsButNotEligibleForDFE | NEXT | Parent Application | /par/app/exit |
    | OnlySelectedTaxCreditsButNotEligibleForDFE | NEXT | Parent Application | /par/app/taxcreditswarning |
    | IfEligibleForDFEAndSelectedTaxCreditsButNotChildcareVouchers | NEXT | Parent Application | /par/app/taxcredits |
    | IfSelectedChildcareVouchers | NEXT | Parent Application | /par/app/registeredschemes |
    |  | NEXT | Parent Application | /par/app/parenttype |

Scenario: Parent Application page /par/app/benefits with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/benefits"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | OnlySelectedNoneOfTheseBenefitsAndOrUnviersalCardCredit |
        | SelectedChildcareBursariesOrGrantsButNotEligibleForDFE |
        | OnlySelectedTaxCreditsButNotEligibleForDFE |
        | IfEligibleForDFEAndSelectedTaxCreditsButNotChildcareVouchers |
        | IfSelectedChildcareVouchers |

