@cic_website
Feature: Is the CIC Website /ccp/acc/ccpsearchadv page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Website /ccp/acc/ccpsearchadv page is correctly displayed
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/acc/ccpsearchadv"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | CCPVIEWACC | CIC Website | /ccp/acc/viewacctcic |

