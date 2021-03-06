@cic_parent_account
Feature: Is the CIC Parent Account /par/app/otherleavepaytypepartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/otherleavepaytypepartner page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/otherleavepaytypepartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedMaternityOrPaternityLeave | NEXT | CIC Parent Account | /par/app/maternitypaypartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpaypartner |
    | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits | NEXT | CIC Parent Account | /par/app/exit |
    | IfOnlySelectedNotInEmployment | NEXT | CIC Parent Account | /par/app/exit |
    |  | NEXT | CIC Parent Account | /par/app/worksummary |

Scenario: CIC Parent Account page /par/app/otherleavepaytypepartner with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/otherleavepaytypepartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedMaternityOrPaternityLeave |
        | IfSelectedAdoptionPay |
        | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits |
        | IfOnlySelectedNotInEmployment |

