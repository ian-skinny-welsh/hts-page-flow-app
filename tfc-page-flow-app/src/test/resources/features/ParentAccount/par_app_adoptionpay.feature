@parent_account
Feature: Is the Parent Account /par/app/adoptionpay page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/adoptionpay page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/adoptionpay"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAllChildrenSelected | NEXT | Parent Account | /par/app/adoptionreturntoworkdate |
    | IfSomeButNoAllChildrenSelected | NEXT | Parent Account | /par/app/adoptionreturntoworkdate |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Account | /par/app/parentminincome |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Account | /par/app/parentminincome |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/adoptionpay with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/adoptionpay"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAllChildrenSelected |
        | IfSomeButNoAllChildrenSelected |
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfHasPartner |

