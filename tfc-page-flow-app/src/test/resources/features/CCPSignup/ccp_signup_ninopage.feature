Feature: Is the CCP Signup /ccp/signup/ninopage page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/ninopage"

Scenario Outline: The next page from website CCP Signup is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | validNinoAndRsaHasBeenDone | NEXT | CCP Signup | /ccp/signup/thankyoufeedback |
    | validNinoAndRsaHasBeenDone | NEXT | CCP Signup | /ccp/signup/thankyoufeedback |
    | invalidNino | NEXT | CCP Signup | /ccp/signup/ninopage |
    |  | NEXT | CCP Signup | /ccp/signup/bankdetails |

Scenario: CCP Signup page /ccp/signup/ninopage with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | validNinoAndRsaHasBeenDone |
        | validNinoAndRsaHasBeenDone |
        | invalidNino |

