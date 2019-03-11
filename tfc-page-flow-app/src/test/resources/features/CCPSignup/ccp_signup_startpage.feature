Feature: Is the CCP Signup /ccp/signup/startpage page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/startpage"

Scenario Outline: The next page from website CCP Signup is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | SIGNINACC | CCP Signup | /ccp/acc/login |
    |  | SIGNINACC | CCP Signup | /ccp/acc/login |
    |  | SIGNINACC | CCP Signup | /par/app/login |
    |  | STARTNOW | CCP Signup | /ccp/signup/signupcode |
    |  | STARTNOW | CCP Signup | /ccp/signup/signupcode |

