@cic_website
Feature: Is the CIC Website /authenticatecode/setpassword page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Website /authenticatecode/setpassword page is correctly displayed
    Given the user has visited "CIC Website" website
    And the user is on page "/authenticatecode/setpassword"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaAction | NEXT | CIC Website | /authenticatecode/rsacapture |
    |  | NEXT | CIC Website | /authenticatecode/finish |

Scenario: CIC Website page /authenticatecode/setpassword with action NEXT rules are ordered correctly
    Given the user has visited "CIC Website" website
    And the user is on page "/authenticatecode/setpassword"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isRsaAction |

