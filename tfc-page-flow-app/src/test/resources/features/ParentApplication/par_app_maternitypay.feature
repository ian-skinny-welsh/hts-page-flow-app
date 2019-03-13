@parent_application
Feature: Is the Parent Application /par/app/maternitypay page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/maternitypay"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | Parent Application | /par/app/returntoworkdate |
    | IfAllChildrenSelected | NEXT | Parent Application | /par/app/returntoworkdate |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpay |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Application | /par/app/parentminincome |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Application | /par/app/parentminincome |
    | IfHasPartner | NEXT | Parent Application | /par/app/partnertype |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/maternitypay with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedAdoptionPay |
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfHasPartner |

