@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/voucherthankyou page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/voucherthankyou page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/voucherthankyou"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | LeaveQualifiesForDFEAndApplyForTFCAnd15HoursFreeEntitlement | NEXT | CIC Parent Reg | /par/app/parenttype |
    |  | NEXT | CIC Parent Reg | /par/app/parenttype |

Scenario: CIC Parent Reg page /par/app/voucherthankyou with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/voucherthankyou"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | LeaveQualifiesForDFEAndApplyForTFCAnd15HoursFreeEntitlement |

