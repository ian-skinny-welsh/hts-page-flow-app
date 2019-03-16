@ccp_account
Feature: Is the CCP Account /ccp/acc/rsaquestions/2 page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/rsaquestions/2 page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestions/2"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isForgotQuestions | NEXT | CCP Account | /ccp/acc/rsaquestions/3 |
    | isMorePages | NEXT | CCP Account | /ccp/acc/rsaquestions |
    | isUpdateTelephone | NEXT | CCP Account | /ccp/acc/rsaphonenumber |
    | isRsaPending | NEXT | CCP Account | /ccp/acc/rsaquestions/3 |
    |  | NEXT | CCP Account | /ccp/acc/rsathankyou |

Scenario: CCP Account page /ccp/acc/rsaquestions/2 with action NEXT rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestions/2"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isForgotQuestions |
        | isMorePages |
        | isUpdateTelephone |
        | isRsaPending |

