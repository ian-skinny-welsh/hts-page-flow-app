Feature: Is the CIC Parent Account /par/app/maternitypay page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/maternitypay"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | CIC Parent Account | /par/app/returntoworkdate |
    | IfSomeButNoAllChildrenSelected | NEXT | CIC Parent Account | /par/app/returntoworkdate |
    | IfAllChildrenSelected | NEXT | CIC Parent Account | /par/app/returntoworkdate |
    | IfAllChildrenSelected | NEXT | CIC Parent Account | /par/app/returntoworkdate |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpay |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfHasPartner | NEXT | CIC Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | CIC Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | CIC Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | CIC Parent Account | /par/app/partnertype |
    |  | NEXT | CIC Parent Account | /par/app/worksummary |
    |  | NEXT | CIC Parent Account | /par/app/worksummary |

Scenario: CIC Parent Account page /par/app/maternitypay with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelected |
        | IfSomeButNoAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfHasPartner |
        | IfHasPartner |
        | IfHasPartner |
        | IfHasPartner |

