Feature: Is the Parent Account /par/app/maternitypaypartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/maternitypaypartner"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdatepartner |
    | IfSomeButNoAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | Parent Account | /par/app/returntoworkdatepartner |
    |  | NEXT | Parent Account | /par/app/parentminincome |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/maternitypaypartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelected |
        | IfSomeButNoAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfAllChildrenSelected |

