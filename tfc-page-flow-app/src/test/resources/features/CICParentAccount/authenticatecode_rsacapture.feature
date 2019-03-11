@cic_parent_account
Feature: Is the CIC Parent Account /authenticatecode/rsacapture page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/authenticatecode/rsacapture"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |

