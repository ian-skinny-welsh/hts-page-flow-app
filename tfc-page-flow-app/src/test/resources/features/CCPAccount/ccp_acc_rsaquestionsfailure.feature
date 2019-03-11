Feature: Is the CCP Account /ccp/acc/rsaquestionsfailure page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaquestionsfailure"

Scenario Outline: The next page from website CCP Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isCcp | NEXT | CCP Account | /ccp/acc/login |
    | isCcp | NEXT | CCP Account | /par/app/login |
    | isCcp | NEXT | CCP Account | /ccp/acc/login |
    |  | NEXT | CCP Account | /ccp/acc/login |
    |  | NEXT | CCP Account | /ccp/acc/login |
    |  | NEXT | CCP Account | /par/app/login |

Scenario: CCP Account page /ccp/acc/rsaquestionsfailure with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isCcp |
        | isCcp |
        | isCcp |

