@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/rolloutdisability page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/rolloutdisability"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsDisabledRollOutOption | NEXT | CIC Parent Reg | /par/app/rolloutmessage |
    |  | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |

Scenario: CIC Parent Reg page /par/app/rolloutdisability with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsDisabledRollOutOption |

