@ccp_signup
Feature: Is the CCP Signup /ccp/signup/nominatedelegate page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CCP Signup /ccp/signup/nominatedelegate page is correctly displayed
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/nominatedelegate"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | nominateDelegateYes | NEXT | CCP Signup | /ccp/signup/enterpassword |
    |  | NEXT | CCP Signup | /ccp/signup/delegatename |

Scenario: CCP Signup page /ccp/signup/nominatedelegate with action NEXT rules are ordered correctly
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/nominatedelegate"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | nominateDelegateYes |

