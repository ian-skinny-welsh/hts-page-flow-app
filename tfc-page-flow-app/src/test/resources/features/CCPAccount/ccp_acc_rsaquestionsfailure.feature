@ccp_account
Feature: Is the CCP Account /ccp/acc/rsaquestionsfailure page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/rsaquestionsfailure page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestionsfailure"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isCcp | NEXT | CCP Account | /ccp/acc/login |
    |  | NEXT | CCP Account | /ccp/acc/login |

Scenario: CCP Account page /ccp/acc/rsaquestionsfailure with action NEXT rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestionsfailure"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isCcp |

