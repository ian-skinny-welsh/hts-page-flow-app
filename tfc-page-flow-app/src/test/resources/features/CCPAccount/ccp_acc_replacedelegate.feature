Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/replacedelegate"

Scenario Outline: The next page from website CCP Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | ifNotReplaceDelegate | NEXT | CCP Account | /ccp/acc/homepage |
    | ifReplaceDelegate | NEXT | CCP Account | /ccp/acc/delegatename |

Scenario: CCP Account page /ccp/acc/replacedelegate with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | ifNotReplaceDelegate |
        | ifReplaceDelegate |

