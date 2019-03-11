Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/signup/bankaccountcountry"

Scenario Outline: The next page from website CIC Website is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedUK | NEXT | CIC Website | /ccp/signup/bankdetails |
    |  | NEXT | CIC Website | /ccp/signup/nonukbankdetails |

Scenario: CIC Website page /ccp/signup/bankaccountcountry with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedUK |

