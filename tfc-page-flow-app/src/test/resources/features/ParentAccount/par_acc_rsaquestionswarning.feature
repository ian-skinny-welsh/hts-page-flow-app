@parent_account
Feature: Is the Parent Account /par/acc/rsaquestionswarning page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/acc/rsaquestionswarning page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/rsaquestionswarning"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isMoreTelephoneAttempts | NEXT | Parent Account | /par/acc/rsaphonedisplay |
    | isMoreStepUpAttempts | NEXT | Parent Account | /par/acc/stepupchallenge |
    |  | NEXT | Parent Account | /par/acc/rsaquestionsfailure |

Scenario: Parent Account page /par/acc/rsaquestionswarning with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/rsaquestionswarning"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isMoreTelephoneAttempts |
        | isMoreStepUpAttempts |

