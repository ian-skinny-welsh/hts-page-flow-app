@ccp_account
Feature: Is the CCP Account /ccp/acc/entrypointpost page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Account /ccp/acc/entrypointpost page is correctly displayed
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/entrypointpost"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isMaintenanceTime | NEXT | CCP Account | /ccp/acc/maintenanceon |
    | isTempPassword | NEXT | CCP Account | /ccp/acc/changetemppassword |
    | isRsaBlocked | NEXT | CCP Account | /ccp/acc/rsaquestions/1 |
    |  | NEXT | CCP Account | /ccp/acc/homepage |

Scenario: CCP Account page /ccp/acc/entrypointpost with action NEXT rules are ordered correctly
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/entrypointpost"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isMaintenanceTime |
        | isTempPassword |
        | isRsaBlocked |

