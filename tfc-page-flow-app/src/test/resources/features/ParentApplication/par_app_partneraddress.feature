@parent_application
Feature: Is the Parent Application /par/app/partneraddress page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/partneraddress page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partneraddress"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfHasChildrenInSystem | NEXT | Parent Application | /par/app/childrensummary |
    |  | NEXT | Parent Application | /par/app/childsname |

Scenario: Parent Application page /par/app/partneraddress with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partneraddress"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfHasChildrenInSystem |

