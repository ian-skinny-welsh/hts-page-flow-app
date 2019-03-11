@parent_account
Feature: Is the Parent Account /par/app/childbirthcertificate page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/childbirthcertificate"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfYes | NEXT | Parent Account | /par/app/childbirthcertificatecountry |
    |  | NEXT | Parent Account | /par/app/childrensummary |

Scenario: Parent Account page /par/app/childbirthcertificate with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfYes |

