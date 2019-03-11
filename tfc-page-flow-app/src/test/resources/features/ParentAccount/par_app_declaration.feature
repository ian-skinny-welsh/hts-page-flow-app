@parent_account
Feature: Is the Parent Account /par/app/declaration page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/declaration"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfOnHoldApplicationsFound | ADDACHILD | Parent Account | /par/app/childrensummary |
    |  | ADDACHILD | Parent Account | /par/app/childsdetails |
    |  | ADDACHILD | Parent Account | /par/app/childsname |
    |  | BENEFITS | Parent Account | /par/app/benefits |
    |  | CHANGEDET | Parent Account | /par/app/changedetails |
    |  | CHILDETAIL | Parent Account | /par/app/childrensummary |
    |  | CONTINUE | Parent Account | /par/app/holdingpage |
    |  | INCOME | Parent Account | /par/app/parentminincome |
    |  | PARDETAIL | Parent Account | /par/app/country |
    |  | PARTDETAIL | Parent Account | /par/app/haspartner |
    |  | PARTWORK | Parent Account | /par/app/partnertype |
    |  | PARTWORK | Parent Account | /par/app/partnertype |
    |  | PARWORK | Parent Account | /par/app/parenttype |
    |  | PARWORK | Parent Account | /par/app/parenttype |

Scenario: Parent Account page /par/app/declaration with action ADDACHILD rules are ordered correctly
    When the user clicks "ADDACHILD"
    Then these rules are executed in order:
        | IfOnHoldApplicationsFound |

