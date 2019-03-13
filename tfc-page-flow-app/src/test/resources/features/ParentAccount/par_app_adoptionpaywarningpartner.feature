@parent_account
Feature: Is the Parent Account /par/app/adoptionpaywarningpartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/adoptionpaywarningpartner page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/adoptionpaywarningpartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/parentminincome |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/partnerminincome |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/adoptionpaywarningpartner with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/adoptionpaywarningpartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |

