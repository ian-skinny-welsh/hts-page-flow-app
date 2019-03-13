@ccp_signup
Feature: Is the CCP Signup /ccp/signup/registereddetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Signup" website
    And the user is on page "/ccp/signup/registereddetails"

Scenario Outline: The next page from website CCP Signup is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IsDetailsIncorrect | NEXT | CCP Signup | /ccp/signup/incorrectregistereddetails |
    | IsEmailAddressEmpty | NEXT | CCP Signup | /ccp/signup/enteremail |
    | IsEmailAddressNotEmptyAndRegulatorIsMOD | NEXT | CCP Signup | /ccp/signup/bankaccountcountry |
    | IsEmailAddressNotEmpty | NEXT | CCP Signup | /ccp/signup/utrchallenge |

Scenario: CCP Signup page /ccp/signup/registereddetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IsDetailsIncorrect |
        | IsEmailAddressEmpty |
        | IsEmailAddressNotEmptyAndRegulatorIsMOD |
        | IsEmailAddressNotEmpty |

