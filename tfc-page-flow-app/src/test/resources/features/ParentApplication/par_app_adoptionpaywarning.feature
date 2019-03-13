@parent_application
Feature: Is the Parent Application /par/app/adoptionpaywarning page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/adoptionpaywarning page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/adoptionpaywarning"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Application | /par/app/parentminincome |
    | IfNotSelectedQualifyingBenefitsAndHasNotPartner | NEXT | Parent Application | /par/app/parentminincome |
    | IfHasPartner | NEXT | Parent Application | /par/app/partnertype |

Scenario: Parent Application page /par/app/adoptionpaywarning with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/adoptionpaywarning"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedQualifyingBenefitsAndHasNotPartner |
        | IfNotSelectedQualifyingBenefitsAndHasNotPartner |
        | IfHasPartner |

