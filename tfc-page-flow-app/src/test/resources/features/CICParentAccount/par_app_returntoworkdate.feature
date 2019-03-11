Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/returntoworkdate"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | CIC Parent Account | /par/app/maternitypaywarning |
    | IfSomeButNoAllChildrenSelectedOver14Days | NEXT | CIC Parent Account | /par/app/maternitypaywarning |
    | IfAllChildrenSelectedOver14Days | NEXT | CIC Parent Account | /par/app/exit |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpay |
    | IfSelectedAdoptionPay | NEXT | CIC Parent Account | /par/app/adoptionpay |
    | IfHasPartner | NEXT | CIC Parent Account | /par/app/partnertype |
    | IfHasPartner | NEXT | CIC Parent Account | /par/app/partnertype |
    |  | NEXT | CIC Parent Account | /par/app/worksummary |

Scenario: CIC Parent Account page /par/app/returntoworkdate with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfSomeButNoAllChildrenSelectedOver14Days |
        | IfAllChildrenSelectedOver14Days |
        | IfSelectedAdoptionPay |
        | IfSelectedAdoptionPay |
        | IfHasPartner |
        | IfHasPartner |

