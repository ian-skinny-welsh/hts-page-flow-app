Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/rsaquestions/2"

Scenario Outline: The next page from website Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isForgotQuestions | NEXT | Parent Account | /par/acc/rsaquestions/3 |
    | isMorePages | NEXT | Parent Account | /par/acc/rsaquestions |
    | isUpdateTelephone | NEXT | Parent Account | /par/acc/rsaphonenumber |
    | isRsaPending | NEXT | Parent Account | /par/acc/rsaquestions/3 |
    |  | NEXT | Parent Account | /par/acc/rsathankyou |

Scenario: Parent Account page /par/acc/rsaquestions/2 with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isForgotQuestions |
        | isMorePages |
        | isUpdateTelephone |
        | isRsaPending |

