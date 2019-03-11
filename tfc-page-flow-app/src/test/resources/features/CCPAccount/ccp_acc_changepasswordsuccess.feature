Feature: Is the CCP Account /ccp/acc/changepasswordsuccess page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/changepasswordsuccess"

Scenario Outline: The next page from website CCP Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaPending | NEXT | CCP Account | /ccp/acc/rsaquestions/1 |
    |  | NEXT | CCP Account | /ccp/acc/homepage |

Scenario: CCP Account page /ccp/acc/changepasswordsuccess with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isRsaPending |

