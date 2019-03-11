Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Signup" website
    And the user is on page "/par/app/rsaquestions/5"

Scenario Outline: The next page from website CCP Signup is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | CCP Signup | /par/app/rsaphonenumber |
    |  | NEXT | CCP Signup | /ccp/signup/rsaphonenumber |

