@parent_account
Feature: Is the Parent Account /par/app/stoptaxcreditswarning page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/stoptaxcreditswarning page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/stoptaxcreditswarning"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfChangeTo30HoursFreeNavRule | NEXT | Parent Account | /par/app/benefits |
    | IfExitApplication | NEXT | Parent Account | /par/app/exit |
    |  | NEXT | Parent Account | /par/app/declaration |

Scenario: Parent Account page /par/app/stoptaxcreditswarning with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/stoptaxcreditswarning"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfChangeTo30HoursFreeNavRule |
        | IfExitApplication |

