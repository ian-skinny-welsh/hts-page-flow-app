Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/maxpaythreshold"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfExpected | NEXT | CIC Parent Reg | /par/app/exit |
    | IfHasPartner | NEXT | CIC Parent Reg | /par/app/partnermaxpaythreshold |
    | IfHasTfcOnly | NEXT | CIC Parent Reg | /par/app/continuetaxcreditswarning |
    | IfHasTfcAndDfe | NEXT | CIC Parent Reg | /par/app/stoptaxcreditswarning |
    |  | NEXT | CIC Parent Reg | /par/app/declaration |

Scenario: CIC Parent Reg page /par/app/maxpaythreshold with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfExpected |
        | IfHasPartner |
        | IfHasTfcOnly |
        | IfHasTfcAndDfe |

