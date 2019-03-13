@cic_website
Feature: Is the CIC Website /ccp/acc/goBackById page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Website /ccp/acc/goBackById page is correctly displayed
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/acc/goBackById"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | returnToAdvancedSearchPageFromViewAccountWhenCookieContainsAdvSearchAsLastSearch | NEXT | CIC Website | /ccp/acc/ccpsearchadv |
    | returnToSearchByIdPageFromViewAccountWhenCookieContainsIdSearchAsLastSearch | NEXT | CIC Website | /ccp/acc/ccpsearchid |

Scenario: CIC Website page /ccp/acc/goBackById with action NEXT rules are ordered correctly
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/acc/goBackById"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | returnToAdvancedSearchPageFromViewAccountWhenCookieContainsAdvSearchAsLastSearch |
        | returnToSearchByIdPageFromViewAccountWhenCookieContainsIdSearchAsLastSearch |

