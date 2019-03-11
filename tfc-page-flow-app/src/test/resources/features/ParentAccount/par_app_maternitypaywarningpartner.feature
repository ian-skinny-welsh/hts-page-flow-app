@parent_account
Feature: Is the Parent Account /par/app/maternitypaywarningpartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/maternitypaywarningpartner"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpaypartner |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/parentminincome |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/parentminincome |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/partnerminincome |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/partnerminincome |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/parentminincome |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | Parent Account | /par/app/parentminincome |
    |  | NEXT | Parent Account | /par/app/parentminincome |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/maternitypaywarningpartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |

