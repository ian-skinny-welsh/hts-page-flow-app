@ccp_signup
Feature: Is the CCP Signup /ccp/signup/uniquetaxreference page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Signup /ccp/signup/uniquetaxreference page is correctly displayed
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/uniquetaxreference"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | validUtrAndRsaHasBeenDone | NEXT | CCP Signup | /ccp/signup/thankyoufeedback |
    | invalidUTR | NEXT | CCP Signup | /ccp/signup/uniquetaxreference |
    |  | NEXT | CCP Signup | /ccp/signup/bankdetails |

Scenario: CCP Signup page /ccp/signup/uniquetaxreference with action NEXT rules are ordered correctly
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/uniquetaxreference"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | validUtrAndRsaHasBeenDone |
        | invalidUTR |

