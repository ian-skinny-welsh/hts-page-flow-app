@parent_application
Feature: Is the Parent Application /par/app/registeredschemes page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/registeredschemes page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/registeredschemes"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEAndSelectedTaxCredits | NEXT | Parent Application | /par/app/taxcredits |
    | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEButNotSelectedTaxCredits | NEXT | Parent Application | /par/app/parenttype |
    | OnlySelectedWorkPlaceNurserySchemaButNotQualifiesForDFE | NEXT | Parent Application | /par/app/parenttype |
    | SelectedMoreOptionsAndQualifiesForDFE | NEXT | Parent Application | /par/app/mustleaveschemes |
    |  | NEXT | Parent Application | /par/app/cvsdeclaration |

Scenario: Parent Application page /par/app/registeredschemes with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/registeredschemes"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEAndSelectedTaxCredits |
        | OnlySelectedWorkPlaceNurserySchemaAndQualifiesForDFEButNotSelectedTaxCredits |
        | OnlySelectedWorkPlaceNurserySchemaButNotQualifiesForDFE |
        | SelectedMoreOptionsAndQualifiesForDFE |

