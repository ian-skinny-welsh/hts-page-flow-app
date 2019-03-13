@parent_application
Feature: Is the Parent Application /par/app/returntoworkdate page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/returntoworkdate page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/returntoworkdate"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Application | /par/app/maternitypaywarning |
    | IfAllChildrenSelectedOver14Days | NEXT | Parent Application | /par/app/exit |
    | IfSelectedAdoptionPay | NEXT | Parent Application | /par/app/adoptionpay |
    | IfHasPartner | NEXT | Parent Application | /par/app/partnertype |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/returntoworkdate with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/returntoworkdate"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfAllChildrenSelectedOver14Days |
        | IfSelectedAdoptionPay |
        | IfHasPartner |

