@ccp_signup
Feature: Is the CCP Signup /ccp/signup/signupcode page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/signupcode"

Scenario Outline: The next page from website CCP Signup is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | CCP Signup | /ccp/signup/registereddetails |
    |  | NEXT | CCP Signup | /ccp/signup/registereddetails |
    |  | NEXT | CCP Signup | /ccp/signup/registereddetails |
    |  | NEXT | CCP Signup | /ccp/signup/registereddetails |

