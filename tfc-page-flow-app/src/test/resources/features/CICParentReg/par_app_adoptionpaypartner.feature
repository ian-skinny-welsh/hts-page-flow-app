@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/adoptionpaypartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/adoptionpaypartner"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNotAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/adoptionreturntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/adoptionreturntoworkdatepartner |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | CIC Parent Reg | /par/app/worksummary |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | CIC Parent Reg | /par/app/worksummary |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | CIC Parent Reg | /par/app/worksummary |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |

Scenario: CIC Parent Reg page /par/app/adoptionpaypartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNotAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |

