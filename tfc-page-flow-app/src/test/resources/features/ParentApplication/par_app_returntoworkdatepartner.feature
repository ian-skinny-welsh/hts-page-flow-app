@parent_application
Feature: Is the Parent Application /par/app/returntoworkdatepartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/returntoworkdatepartner page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/returntoworkdatepartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelectedIneligible | NEXT | Parent Application | /par/app/maternitypaywarningpartner |
    | IfAllChildrenSelectedIneligible | NEXT | Parent Application | /par/app/exit |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/returntoworkdatepartner with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/returntoworkdatepartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelectedIneligible |
        | IfAllChildrenSelectedIneligible |
        | IfSelectedAdoptionPay |

