Feature: Is the Parent Application /par/app/otherleavepaytypepartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/otherleavepaytypepartner"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedMaternityOrPaternityLeave | NEXT | Parent Application | /par/app/maternitypaypartner |
    | IfSelectedMaternityOrPaternityLeave | NEXT | Parent Application | /par/app/maternitypaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    | IfOnlySelectedCarersAllowanceForBoth | NEXT | Parent Application | /par/app/exit |
    | IfOnlySelectedNotInEmployment | NEXT | Parent Application | /par/app/exit |
    |  | NEXT | Parent Application | /par/app/parentminincome |
    | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits | NEXT | Parent Application | /par/app/exit |

Scenario: Parent Application page /par/app/otherleavepaytypepartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedMaternityOrPaternityLeave |
        | IfSelectedMaternityOrPaternityLeave |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfOnlySelectedCarersAllowanceForBoth |
        | IfOnlySelectedNotInEmployment |
        | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits |

