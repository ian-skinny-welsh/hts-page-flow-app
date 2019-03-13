@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/adoptionreturntoworkdate page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/adoptionreturntoworkdate page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/adoptionreturntoworkdate"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | CIC Parent Reg | /par/app/adoptionpaywarning |
    | IfAllChildrenSelectedOver14Days | NEXT | CIC Parent Reg | /par/app/exit |
    | IfHasPartner | NEXT | CIC Parent Reg | /par/app/partnertype |
    |  | NEXT | CIC Parent Reg | /par/app/worksummary |

Scenario: CIC Parent Reg page /par/app/adoptionreturntoworkdate with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/adoptionreturntoworkdate"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfAllChildrenSelectedOver14Days |
        | IfHasPartner |

