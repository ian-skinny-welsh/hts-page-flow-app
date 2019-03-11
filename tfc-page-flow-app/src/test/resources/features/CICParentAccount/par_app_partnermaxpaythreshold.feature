Feature: Is the CIC Parent Account /par/app/partnermaxpaythreshold page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/partnermaxpaythreshold"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfExpected | NEXT | CIC Parent Account | /par/app/exit |
    | IfHasTfcOnly | NEXT | CIC Parent Account | /par/app/continuetaxcreditswarning |
    | IfHasTfcAndDfe | NEXT | CIC Parent Account | /par/app/stoptaxcreditswarning |
    |  | NEXT | CIC Parent Account | /par/app/declaration |

Scenario: CIC Parent Account page /par/app/partnermaxpaythreshold with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfExpected |
        | IfHasTfcOnly |
        | IfHasTfcAndDfe |

