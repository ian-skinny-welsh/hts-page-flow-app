Feature: Is the CCP Account /par/app/entrypointpost page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/par/app/entrypointpost"

Scenario Outline: The next page from website CCP Account is correctly displayed
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

Scenario: CCP Account page /par/app/entrypointpost with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isMaintenanceTime |
        | isTempPassword |
        | isRsaBlocked |

