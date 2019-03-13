@cic_parent_account
Feature: Is the CIC Parent Account /par/app/maxpaythreshold page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/maxpaythreshold page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/maxpaythreshold"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfExpected | NEXT | CIC Parent Account | /par/app/exit |
    | IfHasPartner | NEXT | CIC Parent Account | /par/app/partnermaxpaythreshold |
    | IfHasTfc | NEXT | CIC Parent Account | /par/app/continuetaxcreditswarning |
    | IfHasTfcAndDfe | NEXT | CIC Parent Account | /par/app/stoptaxcreditswarning |
    |  | NEXT | CIC Parent Account | /par/app/declaration |

Scenario: CIC Parent Account page /par/app/maxpaythreshold with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/maxpaythreshold"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfExpected |
        | IfHasPartner |
        | IfHasTfc |
        | IfHasTfcAndDfe |

