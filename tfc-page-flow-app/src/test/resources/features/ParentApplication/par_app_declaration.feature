@parent_application
Feature: Is the Parent Application /par/app/declaration page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/declaration page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/declaration"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | ADDACHILD | Parent Application | /par/app/childsname |
    |  | ADDACHILD | Parent Application | /par/app/childsname |
    |  | BENEFITS | Parent Application | /par/app/benefits |
    |  | BENEFITS | Parent Application | /par/app/benefits |
    |  | CHANGEDET | Parent Application | /par/app/changedetails |
    |  | CHILDETAIL | Parent Application | /par/app/childrensummary |
    |  | CHILDETAIL | Parent Application | /par/app/childrensummary |
    | AdultOrChildFailSecondGoAndSecurityNotDone | CONTINUE | Parent Application | /par/app/enterpassword |
    | AllAdultAndChildPassAndSecurityNotDone | CONTINUE | Parent Application | /par/app/enterpassword |
    |  | CONTINUE | Parent Application | /par/app/holdingpage |
    |  | INCOME | Parent Application | /par/app/parentminincome |
    |  | INCOME | Parent Application | /par/app/parentminincome |
    |  | PARDETAIL | Parent Application | /par/app/country |
    |  | PARDETAIL | Parent Application | /par/app/country |
    |  | PARTDETAIL | Parent Application | /par/app/haspartner |
    |  | PARTDETAIL | Parent Application | /par/app/partnername |
    |  | PARTWORK | Parent Application | /par/app/partnertype |
    |  | PARTWORK | Parent Application | /par/app/partnertype |
    |  | PARWORK | Parent Application | /par/app/parenttype |
    |  | PARWORK | Parent Application | /par/app/parenttype |

Scenario: Parent Application page /par/app/declaration with action CONTINUE rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/declaration"
    When the user clicks "CONTINUE"
    Then these rules are executed in order:
        | AdultOrChildFailSecondGoAndSecurityNotDone |
        | AllAdultAndChildPassAndSecurityNotDone |

