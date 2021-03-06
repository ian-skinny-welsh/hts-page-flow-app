@parent_application
Feature: Is the Parent Application /par/app/adoptionreturntoworkdatepartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/adoptionreturntoworkdatepartner page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/adoptionreturntoworkdatepartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAllChildrenSelectedOver14Days | NEXT | Parent Application | /par/app/exit |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Application | /par/app/adoptionpaywarningpartner |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/adoptionreturntoworkdatepartner with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/adoptionreturntoworkdatepartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAllChildrenSelectedOver14Days |
        | IfSomeButNoAllChildrenSelectedOver14Days |

