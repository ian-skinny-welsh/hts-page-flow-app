Feature: Is the Parent Application /ccp/signup/rsaphonenumber page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/ccp/signup/rsaphonenumber"

Scenario Outline: The next page from website Parent Application is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | AdultOrChildFailFirstGo | NEXT | Parent Application | /par/app/matchingfailure |
    | AdultOrChildFailFirstGo | NEXT | Parent Application | /par/app/matchingfailure |
    |  | NEXT | Parent Application | /par/app/survey |

Scenario: Parent Application page /ccp/signup/rsaphonenumber with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | AdultOrChildFailFirstGo |
        | AdultOrChildFailFirstGo |

