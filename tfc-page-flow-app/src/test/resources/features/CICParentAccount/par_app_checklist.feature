@cic_parent_account
Feature: Is the CIC Parent Account /par/app/checklist page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/checklist page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/checklist"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | CIC Parent Account | /par/app/parentdetailsentry |

