@cic_parent_account
Feature: Is the CIC Parent Account /authenticatecode page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/authenticatecode"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isPasswordAction | NEXT | CIC Parent Account | /authenticatecode/setpassword |
    | isPasswordAction | NEXT | CIC Parent Account | /authenticatecode/setpassword |
    | isPasswordAction | NEXT | CIC Parent Account | /authenticatecode/setpassword |
    | isPasswordAction | NEXT | CIC Parent Account | /authenticatecode/setpassword |
    | isRsaAction | NEXT | CIC Parent Account | /authenticatecode/rsacapture |
    | isRsaAction | NEXT | CIC Parent Account | /authenticatecode/rsacapture |
    | isRsaAction | NEXT | CIC Parent Account | /authenticatecode/rsacapture |
    | isRsaAction | NEXT | CIC Parent Account | /authenticatecode/rsacapture |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |
    |  | NEXT | CIC Parent Account | /authenticatecode/finish |

Scenario: CIC Parent Account page /authenticatecode with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isPasswordAction |
        | isPasswordAction |
        | isPasswordAction |
        | isPasswordAction |
        | isRsaAction |
        | isRsaAction |
        | isRsaAction |
        | isRsaAction |

