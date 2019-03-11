Feature: Is the CIC Parent Reg /par/app/childrensummary page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/childrensummary"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | ADDCHILD | CIC Parent Reg | /par/app/childsdetails |
    |  | ADDCHILD | CIC Parent Reg | /par/app/childsdetails |
    |  | CHANGECHLD | CIC Parent Reg | /par/app/childsdetails |
    |  | CHANGECHLD | CIC Parent Reg | /par/app/childsdetails |
    |  | CONTINUE | CIC Parent Reg | /par/app/benefits |
    |  | CONTINUE | CIC Parent Reg | /par/app/benefits |
    | IfChildHasOpenAccount | REMOVECHLD | CIC Parent Reg | /par/app/cantremovechild |
    | IfChildHasOpenAccount | REMOVECHLD | CIC Parent Reg | /par/app/cantremovechild |
    |  | REMOVECHLD | CIC Parent Reg | /par/app/removechild |
    |  | REMOVECHLD | CIC Parent Reg | /par/app/removechild |

Scenario: CIC Parent Reg page /par/app/childrensummary with action REMOVECHLD rules are ordered correctly
    When the user clicks "REMOVECHLD"
    Then these rules are executed in order:
        | IfChildHasOpenAccount |
        | IfChildHasOpenAccount |

