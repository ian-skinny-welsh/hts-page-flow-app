@ccp_account
Feature: Is the CCP Account /ccp/acc/rsaquestionswarning page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/rsaquestionswarning page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestionswarning"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isMoreTelephoneAttempts | NEXT | CCP Account | /ccp/acc/rsaphonedisplay |
    | isMoreStepUpAttempts | NEXT | CCP Account | /ccp/acc/stepupchallenge |
    |  | NEXT | CCP Account | /ccp/acc/rsaquestionsfailure |

Scenario: CCP Account page /ccp/acc/rsaquestionswarning with action NEXT rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestionswarning"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isMoreTelephoneAttempts |
        | isMoreStepUpAttempts |

