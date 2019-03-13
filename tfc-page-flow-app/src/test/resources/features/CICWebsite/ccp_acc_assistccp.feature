@cic_website
Feature: Is the CIC Website /ccp/acc/assistccp page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Website /ccp/acc/assistccp page is correctly displayed
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/acc/assistccp"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | ADV_SEARCH | CIC Website | /ccp/acc/ccpsearchadv |
    |  | REGISTER | CIC Website | /ccp/signup/signupcode |
    |  | SEARCH | CIC Website | /ccp/acc/ccpsearchid |

