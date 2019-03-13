@parent_application
Feature: Is the Parent Application /par/app/employeraddress page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/employeraddress page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/employeraddress"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | ContinueAndAddAnotherEmployer | ADDANOTHER | Parent Application | /par/app/employeraddress |
    | ContinueAndDisplayOtherEmployer | CONTINUE | Parent Application | /par/app/employeraddress |
    |  | CONTINUE | Parent Application | /par/app/parenttype |

Scenario: Parent Application page /par/app/employeraddress with action CONTINUE rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/employeraddress"
    When the user clicks "CONTINUE"
    Then these rules are executed in order:
        | ContinueAndDisplayOtherEmployer |

Scenario: Parent Application page /par/app/employeraddress with action ADDANOTHER rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/employeraddress"
    When the user clicks "ADDANOTHER"
    Then these rules are executed in order:
        | ContinueAndAddAnotherEmployer |

