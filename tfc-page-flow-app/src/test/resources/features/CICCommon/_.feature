@cic_common
Feature: Is the CIC Common / page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Common / page is correctly displayed
    Given the user has visited "CIC Common" website
    And the user is on page "/"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | AUTHCODE | CIC Common | /authenticatecode |
    |  | UPDATEREG | CIC Common | /updateregulatordetails |

