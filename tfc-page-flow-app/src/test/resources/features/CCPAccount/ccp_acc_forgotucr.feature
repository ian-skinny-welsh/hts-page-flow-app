Feature: Is the CCP Account /ccp/acc/forgotucr page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/forgotucr"

Scenario Outline: The next page from website CCP Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | ifCcpExist | NEXT | CCP Account | /ccp/acc/forgotucrsuccess |
    |  | NEXT | CCP Account | /ccp/acc/forgotucrfailure |

Scenario: CCP Account page /ccp/acc/forgotucr with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | ifCcpExist |

