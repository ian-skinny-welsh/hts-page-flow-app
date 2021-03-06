@parent_application
Feature: Is the Parent Application /par/app/rolloutdob page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/rolloutdob page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/rolloutdob"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsRolloutAvailableForGivenAge | NEXT | Parent Application | /par/app/trialmessage |
    | IsRolloutAvailableForDisabledChildren | NEXT | Parent Application | /par/app/rolloutdisability |
    |  | NEXT | Parent Application | /par/app/rolloutmessage |

Scenario: Parent Application page /par/app/rolloutdob with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/rolloutdob"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsRolloutAvailableForGivenAge |
        | IsRolloutAvailableForDisabledChildren |

