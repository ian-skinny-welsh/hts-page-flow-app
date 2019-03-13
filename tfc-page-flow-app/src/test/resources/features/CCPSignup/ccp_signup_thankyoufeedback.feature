@ccp_signup
Feature: Is the CCP Signup /ccp/signup/thankyoufeedback page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Signup /ccp/signup/thankyoufeedback page is correctly displayed
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/thankyoufeedback"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | CCP Signup | /ccp/signup/thankyou |

