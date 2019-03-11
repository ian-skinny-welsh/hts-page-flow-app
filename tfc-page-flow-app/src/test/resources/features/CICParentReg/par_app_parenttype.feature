Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/parenttype"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/parentselfemploy |
    | IfOnlySelectedNotInEmployment | NEXT | CIC Parent Reg | /par/app/exit |
    | IfOnlySelectedNotInEmployment | NEXT | CIC Parent Reg | /par/app/exit |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | CIC Parent Reg | /par/app/exit |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | CIC Parent Reg | /par/app/exit |
    |  | NEXT | CIC Parent Reg | /par/app/otherleavepaytype |
    |  | NEXT | CIC Parent Reg | /par/app/otherleavepaytype |

Scenario: CIC Parent Reg page /par/app/parenttype with action NEXT rules are ordered correctly
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

