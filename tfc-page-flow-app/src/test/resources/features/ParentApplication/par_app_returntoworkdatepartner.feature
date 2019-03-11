@parent_application
Feature: Is the Parent Application /par/app/returntoworkdatepartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/returntoworkdatepartner"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelectedIneligible | NEXT | Parent Application | /par/app/maternitypaywarningpartner |
    | IfSomeButNoAllChildrenSelectedIneligible | NEXT | Parent Application | /par/app/maternitypaywarningpartner |
    | IfAllChildrenSelectedIneligible | NEXT | Parent Application | /par/app/exit |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/returntoworkdatepartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelectedIneligible |
        | IfSomeButNoAllChildrenSelectedIneligible |
        | IfAllChildrenSelectedIneligible |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |

