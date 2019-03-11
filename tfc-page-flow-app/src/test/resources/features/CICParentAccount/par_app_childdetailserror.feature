Feature: Is the CIC Parent Account /par/app/childdetailserror page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/childdetailserror"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfHasChildrenInSystem | NEXT | CIC Parent Account | /par/app/childrensummary |
    | IfHasChildrenInSystem | NEXT | CIC Parent Account | /par/app/childrensummary |
    |  | NEXT | CIC Parent Account | /par/app/childsdetails |
    |  | NEXT | CIC Parent Account | /par/app/childsname |

Scenario: CIC Parent Account page /par/app/childdetailserror with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfHasChildrenInSystem |
        | IfHasChildrenInSystem |

