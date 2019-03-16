@ccp_account
Feature: Is the CCP Account /ccp/acc/rsaphonenumbers page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/rsaphonenumbers page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/rsaphonenumbers"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | CCP Account | /ccp/acc/rsaphonedisplay |

