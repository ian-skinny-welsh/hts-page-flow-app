@parent_application
Feature: Is the Parent Application /par/app/adoptionreturntoworkdate page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/adoptionreturntoworkdate"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Application | /par/app/adoptionpaywarning |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | Parent Application | /par/app/adoptionpaywarning |
    | IfAllChildrenSelectedOver14Days | NEXT | Parent Application | /par/app/exit |
    | IfHasPartner | NEXT | Parent Application | /par/app/partnertype |
    | IfHasPartner | NEXT | Parent Application | /par/app/partnertype |
    |  | NEXT | Parent Application | /par/app/parentminincome |

Scenario: Parent Application page /par/app/adoptionreturntoworkdate with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfAllChildrenSelectedOver14Days |
        | IfHasPartner |
        | IfHasPartner |

