Feature: Is the Parent Account /par/app/adoptionreturntoworkdatepartner page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/adoptionreturntoworkdatepartner"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfAllChildrenSelectedOver14Days | NEXT | Parent Account | /par/app/exit |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Account | /par/app/adoptionpaywarningpartner |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Account | /par/app/adoptionpaywarningpartner |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/adoptionreturntoworkdatepartner with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfAllChildrenSelectedOver14Days |
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfSomeButNoAllChildrenSelectedOver14Days |

