@ccp_account
Feature: Is the CCP Account /ccp/acc/delegateaction page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/delegateaction page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/delegateaction"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | ifUpdateDelegateDetails | NEXT | CCP Account | /ccp/acc/delegatename |
    | ifRemoveDelegateSelf | NEXT | CCP Account | /ccp/acc/delegateremovedself |
    | ifRemoveDelegate | NEXT | CCP Account | /ccp/acc/delegateremoved |
    | ifReplaceDelegateAction | NEXT | CCP Account | /ccp/acc/replacedelegate |

Scenario: CCP Account page /ccp/acc/delegateaction with action NEXT rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/delegateaction"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | ifUpdateDelegateDetails |
        | ifRemoveDelegateSelf |
        | ifRemoveDelegate |
        | ifReplaceDelegateAction |

