@parent_application
Feature: Is the Parent Application /par/app/applynow page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/applynow page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/applynow"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsWhiteListInactive | NEXT | Parent Application | /par/app/trialmessage |
    | IsRolloutActive | NEXT | Parent Application | /par/app/invitedtotrial |
    |  | NEXT | Parent Application | /par/app/trialdetailsentry |

Scenario: Parent Application page /par/app/applynow with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/applynow"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsWhiteListInactive |
        | IsRolloutActive |

