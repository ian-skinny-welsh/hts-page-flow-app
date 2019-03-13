@cic_parent_account
Feature: Is the CIC Parent Account /par/app/declaration page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/declaration page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/declaration"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfOnHoldApplicationsFound | ADDACHILD | CIC Parent Account | /par/app/childrensummary |
    |  | ADDACHILD | CIC Parent Account | /par/app/childsdetails |
    |  | BENEFITS | CIC Parent Account | /par/app/benefits |
    |  | CHILDETAIL | CIC Parent Account | /par/app/childrensummary |
    |  | CONTINUE | CIC Parent Account | /par/app/holdingpage |
    |  | INCOME | CIC Parent Account | /par/app/parentminincome |
    |  | PARDETAIL | CIC Parent Account | /par/app/country |
    |  | PARTDETAIL | CIC Parent Account | /par/app/haspartner |
    |  | PARTWORK | CIC Parent Account | /par/app/partnertype |
    |  | PARWORK | CIC Parent Account | /par/app/parenttype |

Scenario: CIC Parent Account page /par/app/declaration with action ADDACHILD rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/declaration"
    When the user clicks "ADDACHILD"
    Then these rules are executed in order:
        | IfOnHoldApplicationsFound |

