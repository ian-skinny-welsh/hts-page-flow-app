@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/holdingpage page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/holdingpage page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/holdingpage"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | AdultOrChildFailFirstGo | NEXT | CIC Parent Reg | /par/app/matchingfailure |
    | CICEOIInProgress | NEXT | CIC Parent Reg | /par/app/eoiinprogress |
    | CICEOIFail | NEXT | CIC Parent Reg | /par/app/eoifailure |
    | IfReceivedAPI9Response | NEXT | CIC Parent Reg | /par/app/survey |
    | IfMaxAttemptsReachedAndSecurityDone | NEXT | CIC Parent Reg | /par/app/survey |
    | IfMaxAttemptsReachedAndSecurityNotDone | NEXT | CIC Parent Reg | /par/app/survey |
    |  | NEXT | CIC Parent Reg | /par/app/holdingpage |

Scenario: CIC Parent Reg page /par/app/holdingpage with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/holdingpage"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | AdultOrChildFailFirstGo |
        | CICEOIInProgress |
        | CICEOIFail |
        | IfReceivedAPI9Response |
        | IfMaxAttemptsReachedAndSecurityDone |
        | IfMaxAttemptsReachedAndSecurityNotDone |

