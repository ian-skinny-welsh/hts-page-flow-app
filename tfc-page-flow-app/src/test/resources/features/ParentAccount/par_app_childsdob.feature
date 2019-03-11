@parent_account
Feature: Is the Parent Account /par/app/childsdob page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/childsdob"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | HasMatchedDuplicateApplication | NEXT | Parent Account | /par/app/duplicatechild |
    | IfContinueAddingChildToApp | NEXT | Parent Account | /par/app/continueaddingtwoyearold |
    | IfChildDobNotEligible | NEXT | Parent Account | /par/app/childdetailserror |
    |  | NEXT | Parent Account | /par/app/relationtochild |

Scenario: Parent Account page /par/app/childsdob with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | HasMatchedDuplicateApplication |
        | IfContinueAddingChildToApp |
        | IfChildDobNotEligible |

