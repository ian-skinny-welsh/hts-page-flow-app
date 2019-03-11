Feature: Is the Parent Application /par/app/otherleavepaytype page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/otherleavepaytype"

Scenario Outline: The next page from website Parent Application is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedMaternityOrPaternityLeave | NEXT | Parent Application | /par/app/maternitypay |
    | IfSelectedMaternityOrPaternityLeave | NEXT | Parent Application | /par/app/maternitypay |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpay |
    | IfHasPartner | NEXT | Parent Application | /par/app/partnertype |
    | IfHasPartner | NEXT | Parent Application | /par/app/partnertype |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | Parent Application | /par/app/exit |
    | IfOnlySelectedCarersAllowanceAndNoPartner | NEXT | Parent Application | /par/app/exit |
    | IfOnlySelectedNotInEmployment | NEXT | Parent Application | /par/app/exit |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/otherleavepaytype with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedMaternityOrPaternityLeave |
        | IfSelectedMaternityOrPaternityLeave |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfHasPartner |
        | IfHasPartner |
        | IfOnlySelectedBenefitsAndNoPartner |
        | IfOnlySelectedCarersAllowanceAndNoPartner |
        | IfOnlySelectedNotInEmployment |

