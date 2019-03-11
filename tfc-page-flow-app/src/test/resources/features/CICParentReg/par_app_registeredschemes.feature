@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/registeredschemes page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/registeredschemes"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEAndSelectedTaxCredits | NEXT | CIC Parent Reg | /par/app/taxcredits |
    | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEButNotSelectedTaxCredits | NEXT | CIC Parent Reg | /par/app/parenttype |
    | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEButNotSelectedTaxCredits | NEXT | CIC Parent Reg | /par/app/parenttype |
    | OnlySelectedWorkPlaceNurserySchemaButNotQualifiesForDFE | NEXT | CIC Parent Reg | /par/app/parenttype |
    | OnlySelectedWorkPlaceNurserySchemaButNotQualifiesForDFE | NEXT | CIC Parent Reg | /par/app/parenttype |
    | SelectedMoreOptionsAndQualifiesForDFE | NEXT | CIC Parent Reg | /par/app/mustleaveschemes |
    |  | NEXT | CIC Parent Reg | /par/app/cvsdeclaration |

Scenario: CIC Parent Reg page /par/app/registeredschemes with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEAndSelectedTaxCredits |
        | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEButNotSelectedTaxCredits |
        | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEButNotSelectedTaxCredits |
        | OnlySelectedWorkPlaceNurserySchemaButNotQualifiesForDFE |
        | OnlySelectedWorkPlaceNurserySchemaButNotQualifiesForDFE |
        | SelectedMoreOptionsAndQualifiesForDFE |

