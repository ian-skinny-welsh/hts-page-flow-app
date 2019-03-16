@cic_parent_account
Feature: Is the CIC Parent Account /authenticatecode page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /authenticatecode page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/authenticatecode"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isPasswordAction | NEXT | CIC Parent Account | /authenticatecode/setpassword |
    | isRsaAction | NEXT | CIC Parent Account | /authenticatecode/rsacapture |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |

Scenario: CIC Parent Account page /authenticatecode with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/authenticatecode"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isPasswordAction |
        | isRsaAction |

