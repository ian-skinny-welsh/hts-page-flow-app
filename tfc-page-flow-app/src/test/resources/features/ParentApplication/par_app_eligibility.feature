@parent_application
Feature: Is the Parent Application /par/app/eligibility page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/eligibility"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsMaintenanceTime | NEXT | Parent Application | /par/app/maintenanceon |
    | IsMaintenanceTimeWeekBefore | NEXT | Parent Application | /ccp/acc/buildplannedoutage |
    | IsMaintenanceTimeWeekBefore | NEXT | Parent Application | /par/app/buildplannedoutage |
    | NotVerified | NEXT | Parent Application | /par/app/parentdetailsentry |
    | NotVerified | NEXT | Parent Application | /par/app/parentdetailsentry |
    |  | NEXT | Parent Application | /par/app/existingparentdetails |

Scenario: Parent Application page /par/app/eligibility with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsMaintenanceTime |
        | IsMaintenanceTimeWeekBefore |
        | IsMaintenanceTimeWeekBefore |
        | NotVerified |
        | NotVerified |

