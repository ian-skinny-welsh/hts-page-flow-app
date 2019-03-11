@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/maternitypaypartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/maternitypaypartner"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/returntoworkdatepartner |
    | IfSomeButNoAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/returntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/returntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/returntoworkdatepartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Reg | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Reg | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Reg | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Reg | /par/app/adoptionpaypartner |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |

Scenario: CIC Parent Reg page /par/app/maternitypaypartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelected |
        | IfSomeButNoAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |

