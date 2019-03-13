@cic_website
Feature: Is the CIC Website /authenticatecode page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Website /authenticatecode page is correctly displayed
    Given the user has visited "CIC Website" website
    And the user is on page "/authenticatecode"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isPasswordAction | NEXT | CIC Website | /authenticatecode/setpassword |
    | isRsaAction | NEXT | CIC Website | /authenticatecode/rsacapture |
    |  | NEXT | CIC Website | /authenticatecode/finish |

Scenario: CIC Website page /authenticatecode with action NEXT rules are ordered correctly
    Given the user has visited "CIC Website" website
    And the user is on page "/authenticatecode"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isPasswordAction |
        | isRsaAction |

