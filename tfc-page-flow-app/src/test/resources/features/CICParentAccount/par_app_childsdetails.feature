Feature: Is the CIC Parent Account /par/app/childsdetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/childsdetails"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | HasMatchedDuplicateApplication | NEXT | CIC Parent Account | /par/app/duplicatechild |
    | cic-IfContinueAddingChildToApp | NEXT | CIC Parent Account | /par/app/continueaddingtwoyearold |
    | IfIsNotEligibleAndIsNoDisabledChildEligible | NEXT | CIC Parent Account | /par/app/childdetailserror |
    |  | NEXT | CIC Parent Account | /par/app/childsrelation |

Scenario: CIC Parent Account page /par/app/childsdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | HasMatchedDuplicateApplication |
        | cic-IfContinueAddingChildToApp |
        | IfIsNotEligibleAndIsNoDisabledChildEligible |

