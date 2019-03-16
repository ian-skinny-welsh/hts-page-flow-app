@parent_application
Feature: Is the Parent Application /par/app/haspartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/haspartner page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/haspartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfTheHasPartnerIsTrue | NEXT | Parent Application | /par/app/partnername |
    | IfTheHasPartnerIsFalseAndHasChildrenInSystem | NEXT | Parent Application | /par/app/childrensummary |
    | IfTheHasPartnerIsFalseAndNoChildrenInSystem | NEXT | Parent Application | /par/app/childsname |

Scenario: Parent Application page /par/app/haspartner with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/haspartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfTheHasPartnerIsTrue |
        | IfTheHasPartnerIsFalseAndHasChildrenInSystem |
        | IfTheHasPartnerIsFalseAndNoChildrenInSystem |

