@ccp_account
Feature: Is the CCP Account /ccp/acc/rsaphonedisplay page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/rsaphonedisplay page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaphonedisplay"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaPending | NEXT | CCP Account | /ccp/acc/rsaphonedisplay |
    | isRsaFailure | NEXT | CCP Account | /ccp/acc/rsaquestionswarning |

Scenario: CCP Account page /ccp/acc/rsaphonedisplay with action NEXT rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaphonedisplay"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isRsaPending |
        | isRsaFailure |

