@parent_account
Feature: Is the Parent Account /par/app/maternitypay page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/maternitypay page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/maternitypay"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdate |
    | IfAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdate |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpay |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Account | /par/app/parentminincome |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Account | /par/app/parentminincome |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/maternitypay with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/maternitypay"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedAdoptionPay |
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfHasPartner |

