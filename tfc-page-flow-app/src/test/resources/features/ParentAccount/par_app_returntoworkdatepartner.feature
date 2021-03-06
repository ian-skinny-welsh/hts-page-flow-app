@parent_account
Feature: Is the Parent Account /par/app/returntoworkdatepartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/returntoworkdatepartner page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/returntoworkdatepartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAllChildrenSelectedIneligible | NEXT | Parent Account | /par/app/exit |
    | IfSomeButNoAllChildrenSelectedIneligible | NEXT | Parent Account | /par/app/maternitypaywarningpartner |
    | IfSelectedAdoptionPay | NEXT | Parent Account | /par/app/adoptionpaypartner |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/returntoworkdatepartner with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/returntoworkdatepartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAllChildrenSelectedIneligible |
        | IfSomeButNoAllChildrenSelectedIneligible |
        | IfSelectedAdoptionPay |

