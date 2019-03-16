@parent_account
Feature: Is the Parent Account /par/acc/passwordentryrsa page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/acc/passwordentryrsa page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/passwordentryrsa"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isPasswordCorrect | NEXT | Parent Account | /par/acc/rsaquestions/1 |
    | isPasswordIncorrectFinalAttempt | NEXT | Parent Account | /par/acc/passwordentryfailure |
    |  | NEXT | Parent Account | /par/acc/passwordentrywarning |

Scenario: Parent Account page /par/acc/passwordentryrsa with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/passwordentryrsa"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isPasswordCorrect |
        | isPasswordIncorrectFinalAttempt |

