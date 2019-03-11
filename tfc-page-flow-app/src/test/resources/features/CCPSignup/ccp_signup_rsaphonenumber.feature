@ccp_signup
Feature: Is the CCP Signup /ccp/signup/rsaphonenumber page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/rsaphonenumber"

Scenario Outline: The next page from website CCP Signup is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | invalidUTRorNINO | NEXT | CCP Signup | /ccp/signup/thankyoureenter |
    |  | NEXT | CCP Signup | /ccp/signup/thankyoufeedback |
    |  | NEXT | CCP Signup | /ccp/signup/thankyoufeedback |

Scenario: CCP Signup page /ccp/signup/rsaphonenumber with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | invalidUTRorNINO |

