Feature: Is the Parent Account /par/acc/stepupchallenge page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/stepupchallenge"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isRsaFailure | CONTINUE | Parent Account | /par/acc/rsaquestionsfailure |
    | isRsaWarning | CONTINUE | Parent Account | /par/acc/rsaquestionswarning |
    |  | FRGTANSWER | Parent Account | /par/acc/passwordentryrsa |

Scenario: Parent Account page /par/acc/stepupchallenge with action CONTINUE rules are ordered correctly
    When the user clicks "CONTINUE"
    Then these rules are executed in order:
        | isRsaFailure |
        | isRsaWarning |

