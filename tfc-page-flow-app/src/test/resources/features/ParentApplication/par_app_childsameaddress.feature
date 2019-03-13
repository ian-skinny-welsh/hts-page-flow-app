@parent_application
Feature: Is the Parent Application /par/app/childsameaddress page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/childsameaddress page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/childsameaddress"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfStayOnTheSameAddress | NEXT | Parent Application | /par/app/disabilityquestions |
    |  | NEXT | Parent Application | /par/app/childsaddress |

Scenario: Parent Application page /par/app/childsameaddress with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/childsameaddress"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfStayOnTheSameAddress |

