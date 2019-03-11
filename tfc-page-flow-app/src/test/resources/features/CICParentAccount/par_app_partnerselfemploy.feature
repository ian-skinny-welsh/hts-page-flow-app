Feature: Is the CIC Parent Account /par/app/partnerselfemploy page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/partnerselfemploy"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfHasUTRCICPartner | NEXT | CIC Parent Account | /par/app/partnerselfemployyes |
    | IfHasUTRCICPartner | NEXT | CIC Parent Account | /par/app/partnerselfemployyes |
    | IfHasUTRCICPartner | NEXT | CIC Parent Account | /par/app/partnerselfemployyes |
    | IfHasUTRCICPartner | NEXT | CIC Parent Account | /par/app/partnerselfemployyes |
    |  | NEXT | CIC Parent Account | /par/app/partnerselfemployno |
    |  | NEXT | CIC Parent Account | /par/app/partnerselfemployno |
    |  | NEXT | CIC Parent Account | /par/app/partnerselfemployno |
    |  | NEXT | CIC Parent Account | /par/app/partnerselfemployno |

Scenario: CIC Parent Account page /par/app/partnerselfemploy with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfHasUTRCICPartner |
        | IfHasUTRCICPartner |
        | IfHasUTRCICPartner |
        | IfHasUTRCICPartner |

