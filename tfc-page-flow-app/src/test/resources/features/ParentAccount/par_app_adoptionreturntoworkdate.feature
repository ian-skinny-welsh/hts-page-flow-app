@parent_account
Feature: Is the Parent Account /par/app/adoptionreturntoworkdate page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/adoptionreturntoworkdate page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/adoptionreturntoworkdate"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Account | /par/app/adoptionpaywarning |
    | IfAllChildrenSelectedOver14Days | NEXT | Parent Account | /par/app/exit |
    | IfHasPartner | NEXT | Parent Account | /par/app/partnertype |
    |  | NEXT | Parent Account | /par/app/parentminincome |

Scenario: Parent Account page /par/app/adoptionreturntoworkdate with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/adoptionreturntoworkdate"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfAllChildrenSelectedOver14Days |
        | IfHasPartner |

