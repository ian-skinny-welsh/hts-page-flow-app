@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/maternitypaywarningpartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/maternitypaywarningpartner page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/maternitypaywarningpartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Reg | /par/app/adoptionpaypartner |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | CIC Parent Reg | /par/app/worksummary |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | CIC Parent Reg | /par/app/worksummary |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | CIC Parent Reg | /par/app/worksummary |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |

Scenario: CIC Parent Reg page /par/app/maternitypaywarningpartner with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/maternitypaywarningpartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedAdoptionPay |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |

