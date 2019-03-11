Feature: Is the Parent Account /par/app/survey page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/survey"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsRetryApplicationInProgress | NEXT | Parent Account | /landing |
    |  | NEXT | Parent Account | /par/acc/accounthomepage |
    | IsRetryApplicationInProgress | NOFEEDBACK | Parent Account | /landing |
    |  | NOFEEDBACK | Parent Account | /par/acc/accounthomepage |

Scenario: Parent Account page /par/app/survey with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsRetryApplicationInProgress |

Scenario: Parent Account page /par/app/survey with action NOFEEDBACK rules are ordered correctly
    When the user clicks "NOFEEDBACK"
    Then these rules are executed in order:
        | IsRetryApplicationInProgress |

