@cic_parent_account
Feature: Is the CIC Parent Account /par/app/adoptionpaypartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/adoptionpaypartner page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/adoptionpaypartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNotAllChildrenSelected | NEXT | CIC Parent Account | /par/app/adoptionreturntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | CIC Parent Account | /par/app/adoptionreturntoworkdatepartner |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | CIC Parent Account | /par/app/worksummary |
    |  | NEXT | CIC Parent Account | /par/app/worksummary |

Scenario: CIC Parent Account page /par/app/adoptionpaypartner with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/adoptionpaypartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNotAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |

