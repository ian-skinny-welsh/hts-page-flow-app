@cic_parent_account
Feature: Is the CIC Parent Account /par/app/registeredschemes page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/registeredschemes page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/registeredschemes"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEAndSelectedTaxCredits | NEXT | CIC Parent Account | /par/app/taxcredits |
    | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEButNotSelectedTaxCredits | NEXT | CIC Parent Account | /par/app/parenttype |
    | OnlySelectedWorkPlaceNurserySchemaButNotQualifiesForDFE | NEXT | CIC Parent Account | /par/app/parenttype |
    | SelectedMoreOptionsAndQualifiesForDFE | NEXT | CIC Parent Account | /par/app/mustleaveschemes |
    |  | NEXT | CIC Parent Account | /par/app/cvsdeclaration |

Scenario: CIC Parent Account page /par/app/registeredschemes with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/registeredschemes"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEAndSelectedTaxCredits |
        | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEButNotSelectedTaxCredits |
        | OnlySelectedWorkPlaceNurserySchemaButNotQualifiesForDFE |
        | SelectedMoreOptionsAndQualifiesForDFE |

