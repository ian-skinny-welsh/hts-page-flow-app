@cic_parent_account
Feature: Is the CIC Parent Account /par/app/childsameaddress page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/childsameaddress page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/childsameaddress"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfStayOnTheSameAddress | NEXT | CIC Parent Account | /par/app/disabilityquestions |
    |  | NEXT | CIC Parent Account | /par/app/childsaddress |

Scenario: CIC Parent Account page /par/app/childsameaddress with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/childsameaddress"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfStayOnTheSameAddress |

