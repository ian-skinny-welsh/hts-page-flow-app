@parent_account
Feature: Is the Parent Account /par/app/childrensummary page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/childrensummary page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/childrensummary"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | ADDCHILD | Parent Account | /par/app/childsname |
    |  | CHANGECHLD | Parent Account | /par/app/childsname |
    |  | CONTINUE | Parent Account | /par/app/benefits |
    | IfChildHasOpenAccount | REMOVECHLD | Parent Account | /par/app/cantremovechild |
    |  | REMOVECHLD | Parent Account | /par/app/removechild |

Scenario: Parent Account page /par/app/childrensummary with action REMOVECHLD rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/childrensummary"
    When the user clicks "REMOVECHLD"
    Then these rules are executed in order:
        | IfChildHasOpenAccount |

