Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/maternitypaywarningpartner"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpaypartner |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    |  | NEXT | CIC Parent Account | /par/app/worksummary |
    |  | NEXT | CIC Parent Account | /par/app/worksummary |

Scenario: CIC Parent Account page /par/app/maternitypaywarningpartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |

