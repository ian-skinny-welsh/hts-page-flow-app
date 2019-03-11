Feature: Is the CIC Website /ccp/signup/bankdetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/signup/bankdetails"

Scenario Outline: The next page from website CIC Website is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isBankDetailsPersisted | NEXT | CIC Website | /ccp/signup/contactdetails |
    | isBankDetailsPersisted | NEXT | CIC Website | /ccp/signup/contactdetails |
    |  | NEXT | CIC Website | /ccp/signup/contactdetails |
    |  | NEXT | CIC Website | /ccp/signup/contactdetails |

Scenario: CIC Website page /ccp/signup/bankdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isBankDetailsPersisted |
        | isBankDetailsPersisted |

