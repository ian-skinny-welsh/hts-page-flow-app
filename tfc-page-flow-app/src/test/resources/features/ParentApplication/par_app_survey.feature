Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/survey"

Scenario Outline: The next page from website Parent Application is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsEligibilityProcessingComplete | NEXT | Parent Application | /par/acc/accounthomepage |
    |  | NEXT | Parent Application | /landing |
    | IsEligibilityProcessingComplete | NOFEEDBACK | Parent Application | /par/acc/accounthomepage |
    |  | NOFEEDBACK | Parent Application | /landing |

Scenario: Parent Application page /par/app/survey with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsEligibilityProcessingComplete |

Scenario: Parent Application page /par/app/survey with action NOFEEDBACK rules are ordered correctly
    When the user clicks "NOFEEDBACK"
    Then these rules are executed in order:
        | IsEligibilityProcessingComplete |

