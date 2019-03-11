@parent_account
Feature: Is the Parent Account /par/acc/reconfirmationinfo page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/reconfirmationinfo"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | ParentHasOutstandingUtr | NEXT | Parent Account | /par/acc/reconfirmationutrparent |
    | PartnerHasOutstandingUtr | NEXT | Parent Account | /par/acc/reconfirmationutrpartner |
    | SomePendingChildenFound | NEXT | Parent Account | /par/acc/reconfirmationwarning |
    | VouchersToBeStopped | NEXT | Parent Account | /par/acc/hasstoppedvouchers |
    |  | NEXT | Parent Account | /par/app/declaration |

Scenario: Parent Account page /par/acc/reconfirmationinfo with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | ParentHasOutstandingUtr |
        | PartnerHasOutstandingUtr |
        | SomePendingChildenFound |
        | VouchersToBeStopped |

