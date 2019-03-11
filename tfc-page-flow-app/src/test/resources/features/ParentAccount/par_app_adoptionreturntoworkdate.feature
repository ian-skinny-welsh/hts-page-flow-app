Feature: Is the Parent Account /par/app/adoptionreturntoworkdate page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/adoptionreturntoworkdate"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Account | /par/app/adoptionpaywarning |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Account | /par/app/adoptionpaywarning |
    | IfAllChildrenSelectedOver14Days | NEXT | Parent Account | /par/app/exit |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/adoptionreturntoworkdate with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfAllChildrenSelectedOver14Days |
        | IfHasPartner |
        | IfHasPartner |

