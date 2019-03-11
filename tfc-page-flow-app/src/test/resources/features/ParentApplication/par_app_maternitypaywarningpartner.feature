Feature: Is the Parent Application /par/app/maternitypaywarningpartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/maternitypaywarningpartner"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/partnerminincome |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/partnerminincome |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    |  | NEXT | Parent Application | /par/app/parentminincome |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/maternitypaywarningpartner with action NEXT rules are ordered correctly
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

