Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/adoptionpay"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/adoptionreturntoworkdate |
    | IfAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/adoptionreturntoworkdate |
    | IfSomeButNoAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/adoptionreturntoworkdate |
    | IfSomeButNoAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/adoptionreturntoworkdate |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Reg | /par/app/worksummary |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Reg | /par/app/worksummary |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Reg | /par/app/worksummary |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Reg | /par/app/worksummary |
    | IfHasPartner | NEXT | CIC Parent Reg | /par/app/partnertype |
    | IfHasPartner | NEXT | CIC Parent Reg | /par/app/partnertype |
    | IfHasPartner | NEXT | CIC Parent Reg | /par/app/partnertype |
    | IfHasPartner | NEXT | CIC Parent Reg | /par/app/partnertype |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |

Scenario: CIC Parent Reg page /par/app/adoptionpay with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSomeButNoAllChildrenSelected |
        | IfSomeButNoAllChildrenSelected |
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfHasPartner |
        | IfHasPartner |
        | IfHasPartner |
        | IfHasPartner |

