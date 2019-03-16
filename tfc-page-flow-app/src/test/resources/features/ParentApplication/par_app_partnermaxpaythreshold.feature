@parent_application
Feature: Is the Parent Application /par/app/partnermaxpaythreshold page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/partnermaxpaythreshold page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnermaxpaythreshold"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfExpected | NEXT | Parent Application | /par/app/exit |
    | IfHasTfcOnly | NEXT | Parent Application | /par/app/continuetaxcreditswarning |
    | IfHasTfcAndDfe | NEXT | Parent Application | /par/app/stoptaxcreditswarning |
    |  | NEXT | Parent Application | /par/app/declaration |

Scenario: Parent Application page /par/app/partnermaxpaythreshold with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnermaxpaythreshold"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfExpected |
        | IfHasTfcOnly |
        | IfHasTfcAndDfe |

