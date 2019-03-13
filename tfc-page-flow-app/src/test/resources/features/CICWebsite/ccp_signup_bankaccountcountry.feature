@cic_website
Feature: Is the CIC Website /ccp/signup/bankaccountcountry page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Website /ccp/signup/bankaccountcountry page is correctly displayed
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/signup/bankaccountcountry"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedUK | NEXT | CIC Website | /ccp/signup/bankdetails |
    |  | NEXT | CIC Website | /ccp/signup/nonukbankdetails |

Scenario: CIC Website page /ccp/signup/bankaccountcountry with action NEXT rules are ordered correctly
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/signup/bankaccountcountry"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedUK |

