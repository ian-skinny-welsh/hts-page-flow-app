@cic_parent_account
Feature: Is the CIC Parent Account /par/app/alternativechildverification page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/alternativechildverification page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/alternativechildverification"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfHasNotCompletedAlternativeVerificationProcess | NEXT | CIC Parent Account | /par/app/exittoverification |
    |  | NEXT | CIC Parent Account | /par/app/childsrelation |
    |  | NEXT | CIC Parent Account | /par/app/relationtochild |

Scenario: CIC Parent Account page /par/app/alternativechildverification with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/alternativechildverification"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfHasNotCompletedAlternativeVerificationProcess |

