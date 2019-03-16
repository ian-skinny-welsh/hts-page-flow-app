@cic_parent_account
Feature: Is the CIC Parent Account /par/app/employeraddress page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/employeraddress page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/employeraddress"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | ContinueAndAddAnotherEmployer | ADDANOTHER | CIC Parent Account | /par/app/employeraddress |
    | ContinueAndDisplayOtherEmployer | CONTINUE | CIC Parent Account | /par/app/employeraddress |
    |  | CONTINUE | CIC Parent Account | /par/app/parenttype |

Scenario: CIC Parent Account page /par/app/employeraddress with action CONTINUE rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/employeraddress"
    When the user clicks "CONTINUE"
    Then these rules are executed in order:
        | ContinueAndDisplayOtherEmployer |

Scenario: CIC Parent Account page /par/app/employeraddress with action ADDANOTHER rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/employeraddress"
    When the user clicks "ADDANOTHER"
    Then these rules are executed in order:
        | ContinueAndAddAnotherEmployer |

