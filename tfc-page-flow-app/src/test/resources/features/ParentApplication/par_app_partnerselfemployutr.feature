Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnerselfemployutr"

Scenario Outline: The next page from website Parent Application is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfHasUTR | NEXT | Parent Application | /par/app/partnerselfemployyes |
    | IfHasUTR | NEXT | Parent Application | /par/app/partnerselfemployyes |
    |  | NEXT | Parent Application | /par/app/partnerselfemployno |
    |  | NEXT | Parent Application | /par/app/partnerselfemployno |

Scenario: Parent Application page /par/app/partnerselfemployutr with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfHasUTR |
        | IfHasUTR |

