@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/maternitypaypartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/maternitypaypartner page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/maternitypaypartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/returntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | CIC Parent Reg | /par/app/returntoworkdatepartner |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Reg | /par/app/adoptionpaypartner |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |

Scenario: CIC Parent Reg page /par/app/maternitypaypartner with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/maternitypaypartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedAdoptionPay |

