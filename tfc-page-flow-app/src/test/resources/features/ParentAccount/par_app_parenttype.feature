Feature: Is the Parent Account /par/app/parenttype page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/parenttype"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | Parent Account | /par/app/workstartdate |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | Parent Account | /par/app/workstartdate |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | Parent Account | /par/app/workstartdate |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | Parent Account | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | Parent Account | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | Parent Account | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | Parent Account | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | Parent Account | /par/app/workstartdate |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/parentselfemploy |
    | IfOnlySelectedNotInEmployment | NEXT | Parent Account | /par/app/exit |
    | IfOnlySelectedNotInEmployment | NEXT | Parent Account | /par/app/exit |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | Parent Account | /par/app/exit |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | Parent Account | /par/app/exit |
    |  | NEXT | Parent Account | /par/app/otherleavepaytype |
    |  | NEXT | Parent Account | /par/app/otherleavepaytype |

Scenario: Parent Account page /par/app/parenttype with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfSelectedSelfEmployed |
        | IfOnlySelectedNotInEmployment |
        | IfOnlySelectedNotInEmployment |
        | IfOnlySelectedBenefitsAndNoPartner |
        | IfOnlySelectedBenefitsAndNoPartner |

