@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/partnermaxpaythreshold page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/partnermaxpaythreshold page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/partnermaxpaythreshold"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfExpected | NEXT | CIC Parent Reg | /par/app/exit |
    | IfHasTfcOnly | NEXT | CIC Parent Reg | /par/app/continuetaxcreditswarning |
    | IfHasTfcAndDfe | NEXT | CIC Parent Reg | /par/app/stoptaxcreditswarning |
    |  | NEXT | CIC Parent Reg | /par/app/declaration |

Scenario: CIC Parent Reg page /par/app/partnermaxpaythreshold with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/partnermaxpaythreshold"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfExpected |
        | IfHasTfcOnly |
        | IfHasTfcAndDfe |

