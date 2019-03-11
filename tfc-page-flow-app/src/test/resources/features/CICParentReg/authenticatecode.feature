Feature: Is the CIC Parent Reg /authenticatecode page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/authenticatecode"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isPasswordAction | NEXT | CIC Parent Reg | /authenticatecode/setpassword |
    | isPasswordAction | NEXT | CIC Parent Reg | /authenticatecode/setpassword |
    | isPasswordAction | NEXT | CIC Parent Reg | /authenticatecode/setpassword |
    | isPasswordAction | NEXT | CIC Parent Reg | /authenticatecode/setpassword |
    | isRsaAction | NEXT | CIC Parent Reg | /authenticatecode/rsacapture |
    | isRsaAction | NEXT | CIC Parent Reg | /authenticatecode/rsacapture |
    | isRsaAction | NEXT | CIC Parent Reg | /authenticatecode/rsacapture |
    | isRsaAction | NEXT | CIC Parent Reg | /authenticatecode/rsacapture |
    |  | NEXT | CIC Parent Reg | /authenticatecode/finish |
    |  | NEXT | CIC Parent Reg | /authenticatecode/finish |
    |  | NEXT | CIC Parent Reg | /authenticatecode/finish |
    |  | NEXT | CIC Parent Reg | /authenticatecode/finish |

Scenario: CIC Parent Reg page /authenticatecode with action NEXT rules are ordered correctly
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

