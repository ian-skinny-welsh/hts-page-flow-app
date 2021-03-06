@cic_parent_account
Feature: Is the CIC Parent Account /par/acc/rsaquestions/5 page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/acc/rsaquestions/5 page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/rsaquestions/5"
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
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/rsaquestions/5"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isUpdateTelephone |
        | isRsaPending |

