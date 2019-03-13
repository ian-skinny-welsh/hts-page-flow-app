@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/parentdetailsentry page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/parentdetailsentry"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | HasExistingApplication | NEXT | CIC Parent Reg | /par/app/hasactiveapplication |
    |  | NEXT | CIC Parent Reg | /par/app/country |

Scenario: CIC Parent Reg page /par/app/parentdetailsentry with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | HasExistingApplication |

