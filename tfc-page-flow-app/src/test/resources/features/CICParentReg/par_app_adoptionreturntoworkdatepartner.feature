@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/adoptionreturntoworkdatepartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/adoptionreturntoworkdatepartner page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/adoptionreturntoworkdatepartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAllChildrenSelectedOver14Days | NEXT | CIC Parent Reg | /par/app/exit |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | CIC Parent Reg | /par/app/adoptionpaywarningpartner |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |

Scenario: CIC Parent Reg page /par/app/adoptionreturntoworkdatepartner with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/adoptionreturntoworkdatepartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAllChildrenSelectedOver14Days |
        | IfSomeButNoAllChildrenSelectedOver14Days |

