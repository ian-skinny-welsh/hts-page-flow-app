@parent_account
Feature: Is the Parent Account /par/app/taxcredits page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/taxcredits page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/taxcredits"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | StopTaxCreditsAndApplyForTFCAnd15HoursFreeEntitlement | NEXT | Parent Account | /par/app/canceltaxcredits |
    |  | NEXT | Parent Account | /par/app/continuetaxcredits |

Scenario: Parent Account page /par/app/taxcredits with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/taxcredits"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | StopTaxCreditsAndApplyForTFCAnd15HoursFreeEntitlement |

