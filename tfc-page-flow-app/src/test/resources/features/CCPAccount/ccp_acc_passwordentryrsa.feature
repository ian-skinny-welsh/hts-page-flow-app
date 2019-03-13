@ccp_account
Feature: Is the CCP Account /ccp/acc/passwordentryrsa page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/passwordentryrsa page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/passwordentryrsa"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isPasswordCorrect | NEXT | CCP Account | /ccp/acc/rsaquestions/1 |
    | isPasswordIncorrectFinalAttempt | NEXT | CCP Account | /ccp/acc/passwordentryfailure |
    |  | NEXT | CCP Account | /ccp/acc/passwordentrywarning |

Scenario: CCP Account page /ccp/acc/passwordentryrsa with action NEXT rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/passwordentryrsa"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isPasswordCorrect |
        | isPasswordIncorrectFinalAttempt |

