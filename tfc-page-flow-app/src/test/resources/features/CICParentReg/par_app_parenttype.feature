@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/parenttype page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/parenttype page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/parenttype"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Reg | /par/app/workstartdate |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Reg | /par/app/parentselfemploy |
    | IfOnlySelectedNotInEmployment | NEXT | CIC Parent Reg | /par/app/exit |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | CIC Parent Reg | /par/app/exit |
    |  | NEXT | CIC Parent Reg | /par/app/otherleavepaytype |

Scenario: CIC Parent Reg page /par/app/parenttype with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/parenttype"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedSelfEmployed |
        | IfOnlySelectedNotInEmployment |
        | IfOnlySelectedBenefitsAndNoPartner |

