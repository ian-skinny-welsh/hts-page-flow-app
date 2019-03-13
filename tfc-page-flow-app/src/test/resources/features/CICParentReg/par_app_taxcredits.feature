@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/taxcredits page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/taxcredits page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/taxcredits"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | StopTaxCreditsAndApplyForTFCAnd15HoursFreeEntitlement | NEXT | CIC Parent Reg | /par/app/canceltaxcredits |
    |  | NEXT | CIC Parent Reg | /par/app/continuetaxcredits |

Scenario: CIC Parent Reg page /par/app/taxcredits with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/taxcredits"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | StopTaxCreditsAndApplyForTFCAnd15HoursFreeEntitlement |

