Feature: Is the Parent Account /par/app/otherleavepaytype page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/otherleavepaytype"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedMaternityOrPaternityLeave | NEXT | Parent Account | /par/app/maternitypay |
    | IfSelectedMaternityOrPaternityLeave | NEXT | Parent Account | /par/app/maternitypay |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpay |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | Parent Account | /par/app/exit |
    | IfOnlySelectedNotInEmployment | NEXT | Parent Account | /par/app/exit |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/otherleavepaytype with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedMaternityOrPaternityLeave |
        | IfSelectedMaternityOrPaternityLeave |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfHasPartner |
        | IfHasPartner |
        | IfOnlySelectedBenefitsAndNoPartner |
        | IfOnlySelectedNotInEmployment |

