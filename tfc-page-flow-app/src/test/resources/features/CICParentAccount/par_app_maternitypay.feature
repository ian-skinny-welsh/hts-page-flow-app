@cic_parent_account
Feature: Is the CIC Parent Account /par/app/maternitypay page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/maternitypay page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/maternitypay"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | CIC Parent Account | /par/app/returntoworkdate |
    | IfAllChildrenSelected | NEXT | CIC Parent Account | /par/app/returntoworkdate |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpay |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfHasPartner | NEXT | CIC Parent Account | /par/app/partnertype |
    |  | NEXT | CIC Parent Account | /par/app/worksummary |

Scenario: CIC Parent Account page /par/app/maternitypay with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/maternitypay"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedAdoptionPay |
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfHasPartner |

