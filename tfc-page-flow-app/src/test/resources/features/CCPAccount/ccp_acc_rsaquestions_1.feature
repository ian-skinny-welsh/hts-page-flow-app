Feature: Is the CCP Account /ccp/acc/rsaquestions/1 page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestions/1"

Scenario Outline: The next page from website CCP Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isForgotQuestions | NEXT | CCP Account | /ccp/acc/rsaquestions/2 |
    | isMorePages | NEXT | CCP Account | /ccp/acc/rsaquestions |
    | isUpdateTelephone | NEXT | CCP Account | /ccp/acc/rsaphonenumber |
    | isRsaPending | NEXT | CCP Account | /ccp/acc/rsaquestions/2 |
    |  | NEXT | CCP Account | /ccp/acc/rsathankyou |

Scenario: CCP Account page /ccp/acc/rsaquestions/1 with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isForgotQuestions |
        | isMorePages |
        | isUpdateTelephone |
        | isRsaPending |

