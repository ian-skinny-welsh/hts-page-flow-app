@parent_application
Feature: Is the Parent Application /par/app/invitedtotrial page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/invitedtotrial page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/invitedtotrial"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsInvitedToTrial | NEXT | Parent Application | /par/app/trialdetailsentry |
    | IsRolloutAgeBase | NEXT | Parent Application | /par/app/rolloutdob |
    | IsRolloutFEFOnly | NEXT | Parent Application | /par/app/livesinengland |
    | IsRolloutCountryFoBirth | NEXT | Parent Application | /par/app/verifychildren |
    |  | NEXT | Parent Application | /par/app/trialmessage |

Scenario: Parent Application page /par/app/invitedtotrial with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/invitedtotrial"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsInvitedToTrial |
        | IsRolloutAgeBase |
        | IsRolloutFEFOnly |
        | IsRolloutCountryFoBirth |

