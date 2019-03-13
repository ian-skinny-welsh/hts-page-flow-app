@parent_application
Feature: Is the Parent Application /par/app/maternitypaypartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/maternitypaypartner page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/maternitypaypartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelected | NEXT | Parent Application | /par/app/returntoworkdatepartner |
    | IfAllChildrenSelected | NEXT | Parent Application | /par/app/returntoworkdatepartner |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpaypartner |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/maternitypaypartner with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/maternitypaypartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelected |
        | IfAllChildrenSelected |
        | IfSelectedAdoptionPay |

