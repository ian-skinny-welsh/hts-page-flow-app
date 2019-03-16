@cic_parent_account
Feature: Is the CIC Parent Account /par/app/partnerselfemployno page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/partnerselfemployno page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/partnerselfemployno"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAppliedForUTR | NEXT | CIC Parent Account | /par/app/partnerselfemployapplied |
    |  | NEXT | CIC Parent Account | /par/app/exit |

Scenario: CIC Parent Account page /par/app/partnerselfemployno with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/partnerselfemployno"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAppliedForUTR |

