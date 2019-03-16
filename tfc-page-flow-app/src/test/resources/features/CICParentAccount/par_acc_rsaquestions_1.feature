@cic_parent_account
Feature: Is the CIC Parent Account /par/acc/rsaquestions/1 page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/acc/rsaquestions/1 page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/rsaquestions/1"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isForgotQuestions | NEXT | CIC Parent Account | /par/acc/rsaquestions/2 |
    | isMorePages | NEXT | CIC Parent Account | /par/acc/rsaquestions |
    | isUpdateTelephone | NEXT | CIC Parent Account | /par/acc/rsaphonenumber |
    | isRsaPending | NEXT | CIC Parent Account | /par/acc/rsaquestions/2 |
    |  | NEXT | CIC Parent Account | /par/acc/rsathankyou |

Scenario: CIC Parent Account page /par/acc/rsaquestions/1 with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/rsaquestions/1"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isForgotQuestions |
        | isMorePages |
        | isUpdateTelephone |
        | isRsaPending |

