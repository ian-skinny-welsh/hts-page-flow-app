@cic_parent_account
Feature: Is the CIC Parent Account /par/app/childdetailserror page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/childdetailserror page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/childdetailserror"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfHasChildrenInSystem | NEXT | CIC Parent Account | /par/app/childrensummary |
    |  | NEXT | CIC Parent Account | /par/app/childsdetails |

Scenario: CIC Parent Account page /par/app/childdetailserror with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/childdetailserror"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfHasChildrenInSystem |

