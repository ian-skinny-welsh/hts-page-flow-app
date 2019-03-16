@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/declaration page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/declaration page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/declaration"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | ADDACHILD | CIC Parent Reg | /par/app/childsdetails |
    |  | BENEFITS | CIC Parent Reg | /par/app/benefits |
    |  | CHILDETAIL | CIC Parent Reg | /par/app/childrensummary |
    |  | CONTINUE | CIC Parent Reg | /par/app/holdingpage |
    |  | INCOME | CIC Parent Reg | /par/app/parentminincome |
    |  | PARDETAIL | CIC Parent Reg | /par/app/country |
    |  | PARTDETAIL | CIC Parent Reg | /par/app/haspartner |
    |  | PARTWORK | CIC Parent Reg | /par/app/partnertype |
    |  | PARWORK | CIC Parent Reg | /par/app/parenttype |

