Feature: Is the Parent Account /par/acc/hasstoppedvouchers page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/hasstoppedvouchers"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | CancelledVouchers | NEXT | Parent Account | /par/app/declaration |
    | AppTypeTfcAndEfeAndNotCancelledVouchers | NEXT | Parent Account | /par/acc/reconfirmeligibility |
    |  | NEXT | Parent Account | /par/acc/notstoppedvouchers |

Scenario: Parent Account page /par/acc/hasstoppedvouchers with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | CancelledVouchers |
        | AppTypeTfcAndEfeAndNotCancelledVouchers |

