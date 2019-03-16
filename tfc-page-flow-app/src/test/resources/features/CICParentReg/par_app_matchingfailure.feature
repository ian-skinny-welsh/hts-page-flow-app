@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/matchingfailure page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/matchingfailure page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/matchingfailure"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | CIC Parent Reg | /par/app/declaration |

