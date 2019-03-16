@parent_application
Feature: Is the Parent Application /par/app/adoptionpaypartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/adoptionpaypartner page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/adoptionpaypartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNotAllChildrenSelected | NEXT | Parent Application | /par/app/adoptionreturntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | Parent Application | /par/app/adoptionreturntoworkdatepartner |
    | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    | IfPartnerAndParentHaveSelectedQualifyingBenefits | NEXT | Parent Application | /par/app/parentminincome |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/adoptionpaypartner with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/adoptionpaypartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNotAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedQualifyingBenefitsAndParentHasNotSelectedQualifyingBenefits |
        | IfNotSelectedStatutorySickPayAndQualifyingBenefitsButParentHasSelectedQualifyingBenefits |
        | IfPartnerAndParentHaveSelectedQualifyingBenefits |

