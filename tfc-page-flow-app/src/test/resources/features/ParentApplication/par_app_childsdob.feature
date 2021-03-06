@parent_application
Feature: Is the Parent Application /par/app/childsdob page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/childsdob page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/childsdob"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | HasMatchedDuplicateApplication | NEXT | Parent Application | /par/app/duplicatechild |
    | IfContinueAddingChildToApp | NEXT | Parent Application | /par/app/continueaddingtwoyearold |
    | IfChildDobNotEligible | NEXT | Parent Application | /par/app/childdetailserror |
    |  | NEXT | Parent Application | /par/app/relationtochild |

Scenario: Parent Application page /par/app/childsdob with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/childsdob"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | HasMatchedDuplicateApplication |
        | IfContinueAddingChildToApp |
        | IfChildDobNotEligible |

