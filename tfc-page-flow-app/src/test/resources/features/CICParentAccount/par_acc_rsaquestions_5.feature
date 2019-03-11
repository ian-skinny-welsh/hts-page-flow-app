Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/rsaquestions/5"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isUpdateTelephone | NEXT | CIC Parent Account | /par/acc/rsaphonenumber |
    | isRsaPending | NEXT | CIC Parent Account | /par/acc/rsaphonenumber |
    |  | NEXT | CIC Parent Account | /par/acc/rsathankyou |

Scenario: CIC Parent Account page /par/acc/rsaquestions/5 with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isUpdateTelephone |
        | isRsaPending |

