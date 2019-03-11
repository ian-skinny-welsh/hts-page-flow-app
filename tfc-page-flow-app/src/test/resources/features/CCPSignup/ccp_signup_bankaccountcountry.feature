Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/bankaccountcountry"

Scenario Outline: The next page from website CCP Signup is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedUK | NEXT | CCP Signup | /ccp/signup/bankdetails |
    |  | NEXT | CCP Signup | /ccp/signup/nonukbankdetails |

Scenario: CCP Signup page /ccp/signup/bankaccountcountry with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedUK |

