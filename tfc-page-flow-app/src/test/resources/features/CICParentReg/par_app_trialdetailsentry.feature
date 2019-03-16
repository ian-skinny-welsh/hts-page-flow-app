@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/trialdetailsentry page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/trialdetailsentry page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/trialdetailsentry"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsPersonOnWhitelist | NEXT | CIC Parent Reg | /par/app/parentdetailsentry |
    | IsRollOutFiltersOn | NEXT | CIC Parent Reg | /par/app/trialwarning |

Scenario: CIC Parent Reg page /par/app/trialdetailsentry with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/trialdetailsentry"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsPersonOnWhitelist |
        | IsRollOutFiltersOn |

