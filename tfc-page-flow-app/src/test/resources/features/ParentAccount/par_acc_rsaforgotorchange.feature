@parent_account
Feature: Is the Parent Account /par/acc/rsaforgotorchange page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/acc/rsaforgotorchange page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/rsaforgotorchange"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isChangeQuestions | NEXT | Parent Account | /par/acc/rsachangequestionselect |
    |  | NEXT | Parent Account | /par/acc/passwordentryrsa |

Scenario: Parent Account page /par/acc/rsaforgotorchange with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/rsaforgotorchange"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isChangeQuestions |

