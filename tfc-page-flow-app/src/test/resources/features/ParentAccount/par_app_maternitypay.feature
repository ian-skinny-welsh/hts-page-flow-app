@parent_account
Feature: Is the Parent Account /par/app/maternitypay page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/maternitypay"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdate |
    | IfSomeButNoAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdate |
    | IfAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdate |
    | IfAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdate |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpay |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Account | /par/app/parentminincome |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Account | /par/app/parentminincome |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Account | /par/app/parentminincome |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Account | /par/app/parentminincome |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    |  | NEXT | Parent Account | /par/app/parentminincome |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/maternitypay with action NEXT rules are ordered correctly
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

