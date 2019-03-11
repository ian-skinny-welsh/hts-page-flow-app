Feature: Is the CIC Parent Account /par/acc/stepupchallenge page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/stepupchallenge"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaFailure | CONTINUE | CIC Parent Account | /par/acc/rsaquestionsfailure |
    | isRsaWarning | CONTINUE | CIC Parent Account | /par/acc/rsaquestionswarning |
    |  | FRGTANSWER | CIC Parent Account | /par/acc/reauthenticatepage |

Scenario: CIC Parent Account page /par/acc/stepupchallenge with action CONTINUE rules are ordered correctly
    When the user clicks "CONTINUE"
    Then these rules are executed in order:
        | isRsaFailure |
        | isRsaWarning |

