@cic_website
Feature: Is the CIC Website /ccp/signup/contactdetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/signup/contactdetails"

Scenario Outline: The next page from website CIC Website is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isNinoUTRValid | NEXT | CIC Website | /ccp/signup/thankyoufeedback |
    | isNinoUTRValid | NEXT | CIC Website | /ccp/signup/thankyoufeedback |
    | isNinoUTRValid | NEXT | CIC Website | /ccp/signup/thankyoufeedback |
    | isNinoUTRValid | NEXT | CIC Website | /ccp/signup/thankyoufeedback |
    |  | NEXT | CIC Website | /ccp/signup/validationprogress |
    |  | NEXT | CIC Website | /ccp/signup/validationprogress |

Scenario: CIC Website page /ccp/signup/contactdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isNinoUTRValid |
        | isNinoUTRValid |
        | isNinoUTRValid |
        | isNinoUTRValid |

