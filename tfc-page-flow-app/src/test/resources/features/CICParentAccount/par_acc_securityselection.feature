@cic_parent_account
Feature: Is the CIC Parent Account /par/acc/securityselection page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/acc/securityselection page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/securityselection"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isResetPassword | NEXT | CIC Parent Account | /par/acc/setpassword |
    |  | NEXT | CIC Parent Account | /par/acc/security |

Scenario: CIC Parent Account page /par/acc/securityselection with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/securityselection"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isResetPassword |

