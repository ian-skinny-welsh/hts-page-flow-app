@parent_account
Feature: Is the Parent Account /par/acc/childremovalsummary page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/acc/childremovalsummary page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/childremovalsummary"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | CANCELPMNT | Parent Account | /par/acc/accountsummary |
    |  | CHANGEPMNT | Parent Account | /par/acc/childremovaldetailsentry |
    |  | CLOSEACC | Parent Account | /par/acc/childremovalconfirm |

