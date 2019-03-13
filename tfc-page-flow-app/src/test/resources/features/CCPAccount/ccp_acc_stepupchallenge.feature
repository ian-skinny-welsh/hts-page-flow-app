@ccp_account
Feature: Is the CCP Account /ccp/acc/stepupchallenge page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/stepupchallenge page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/stepupchallenge"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaFailure | CONTINUE | CCP Account | /ccp/acc/rsaquestionsfailure |
    | isRsaWarning | CONTINUE | CCP Account | /ccp/acc/rsaquestionswarning |
    |  | FRGTANSWER | CCP Account | /ccp/acc/passwordentryrsa |

Scenario: CCP Account page /ccp/acc/stepupchallenge with action CONTINUE rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/stepupchallenge"
    When the user clicks "CONTINUE"
    Then these rules are executed in order:
        | isRsaFailure |
        | isRsaWarning |

