@cic_parent_account
Feature: Is the CIC Parent Account /par/acc/reauthenticatepage page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/acc/reauthenticatepage page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/reauthenticatepage"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isPasswordCorrect | NEXT | CIC Parent Account | /par/acc/reauthenticatepage |
    | isPasswordIncorrectFinalAttempt | NEXT | CIC Parent Account | /par/acc/reauthenticatefailure |
    |  | NEXT | CIC Parent Account | /par/acc/reauthenticatewarning |

Scenario: CIC Parent Account page /par/acc/reauthenticatepage with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/reauthenticatepage"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isPasswordCorrect |
        | isPasswordIncorrectFinalAttempt |

