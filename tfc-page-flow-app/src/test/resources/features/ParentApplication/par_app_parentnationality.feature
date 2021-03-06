@parent_application
Feature: Is the Parent Application /par/app/parentnationality page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/parentnationality page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parentnationality"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | NeitherUKorEU | NEXT | Parent Application | /par/app/parentrecourse |
    |  | NEXT | Parent Application | /par/app/parentdetails |

Scenario: Parent Application page /par/app/parentnationality with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/parentnationality"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | NeitherUKorEU |

