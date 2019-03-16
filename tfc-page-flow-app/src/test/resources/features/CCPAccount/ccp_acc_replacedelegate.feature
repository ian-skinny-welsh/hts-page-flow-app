@ccp_account
Feature: Is the CCP Account /ccp/acc/replacedelegate page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/replacedelegate page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/replacedelegate"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | ifNotReplaceDelegate | NEXT | CCP Account | /ccp/acc/homepage |
    | ifReplaceDelegate | NEXT | CCP Account | /ccp/acc/delegatename |

Scenario: CCP Account page /ccp/acc/replacedelegate with action NEXT rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/replacedelegate"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | ifNotReplaceDelegate |
        | ifReplaceDelegate |

