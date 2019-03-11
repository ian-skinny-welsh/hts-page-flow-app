@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/partnertype page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/partnertype"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdatepartner |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdatepartner |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdatepartner |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdatepartner |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdatepartner |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdatepartner |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdatepartner |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdatepartner |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/partnerselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/partnerselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/partnerselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/partnerselfemploy |
    | IfOnlySelectedNotInEmployment | NEXT | CIC Parent Reg | /par/app/exit |
    | IfOnlySelectedNotInEmployment | NEXT | CIC Parent Reg | /par/app/exit |
    | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits | NEXT | CIC Parent Reg | /par/app/exit |
    | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits | NEXT | CIC Parent Reg | /par/app/exit |
    |  | NEXT | CIC Parent Reg | /par/app/otherleavepaytypepartner |
    |  | NEXT | CIC Parent Reg | /par/app/otherleavepaytypepartner |

Scenario: CIC Parent Reg page /par/app/partnertype with action NEXT rules are ordered correctly
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
        | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits |
        | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits |

