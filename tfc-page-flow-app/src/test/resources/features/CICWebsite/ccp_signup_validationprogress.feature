@cic_website
Feature: Is the CIC Website /ccp/signup/validationprogress page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Website /ccp/signup/validationprogress page is correctly displayed
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/signup/validationprogress"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isUTRNinoValNotFailed | NEXT | CIC Website | /ccp/signup/thankyoufeedback |
    | isUTRNinoValFailed | NEXT | CIC Website | /ccp/signup/ninoutr |

Scenario: CIC Website page /ccp/signup/validationprogress with action NEXT rules are ordered correctly
    Given the user has visited "CIC Website" website
    And the user is on page "/ccp/signup/validationprogress"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | isUTRNinoValNotFailed |
        | isUTRNinoValFailed |

