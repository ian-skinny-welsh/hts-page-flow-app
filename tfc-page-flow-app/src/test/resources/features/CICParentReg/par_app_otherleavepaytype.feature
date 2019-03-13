@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/otherleavepaytype page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/otherleavepaytype page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/otherleavepaytype"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedMaternityOrPaternityLeave | NEXT | CIC Parent Reg | /par/app/maternitypay |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Reg | /par/app/adoptionpay |
    | IfHasPartner | NEXT | CIC Parent Reg | /par/app/partnertype |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | CIC Parent Reg | /par/app/exit |
    | IfOnlySelectedNotInEmployment | NEXT | CIC Parent Reg | /par/app/exit |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |

Scenario: CIC Parent Reg page /par/app/otherleavepaytype with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/otherleavepaytype"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedMaternityOrPaternityLeave |
        | IfSelectedAdoptionPay |
        | IfHasPartner |
        | IfOnlySelectedBenefitsAndNoPartner |
        | IfOnlySelectedNotInEmployment |

