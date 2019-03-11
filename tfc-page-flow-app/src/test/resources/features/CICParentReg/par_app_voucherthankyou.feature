@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/voucherthankyou page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/voucherthankyou"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | LeaveQualifiesForDFEAndApplyForTFCAnd15HoursFreeEntitlement | NEXT | CIC Parent Reg | /par/app/parenttype |
    | LeaveQualifiesForDFEAndApplyForTFCAnd15HoursFreeEntitlement | NEXT | CIC Parent Reg | /par/app/parenttype |
    |  | NEXT | CIC Parent Reg | /par/app/parenttype |
    |  | NEXT | CIC Parent Reg | /par/app/parenttype |

Scenario: CIC Parent Reg page /par/app/voucherthankyou with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | LeaveQualifiesForDFEAndApplyForTFCAnd15HoursFreeEntitlement |
        | LeaveQualifiesForDFEAndApplyForTFCAnd15HoursFreeEntitlement |

