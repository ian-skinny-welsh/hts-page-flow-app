@cic_parent_account
Feature: Is the CIC Parent Account /par/acc/securemessages page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/securemessages"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsPDF | NEXT | CIC Parent Account | /par/acc/securepdf |
    |  | NEXT | CIC Parent Account | /par/acc/securemessage |

Scenario: CIC Parent Account page /par/acc/securemessages with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsPDF |

