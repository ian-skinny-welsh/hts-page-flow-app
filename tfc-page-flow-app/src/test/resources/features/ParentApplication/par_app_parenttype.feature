@parent_application
Feature: Is the Parent Application /par/app/parenttype page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/parenttype page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parenttype"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | Parent Application | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | Parent Application | /par/app/workstartdate |
    | IfSelectedSelfEmployed | NEXT | Parent Application | /par/app/parentselfemploy |
    | IfOnlySelectedNotInEmployment | NEXT | Parent Application | /par/app/exit |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | Parent Application | /par/app/exit |
    |  | NEXT | Parent Application | /par/app/otherleavepaytype |

Scenario: Parent Application page /par/app/parenttype with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parenttype"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedSelfEmployed |
        | IfOnlySelectedNotInEmployment |
        | IfOnlySelectedBenefitsAndNoPartner |

