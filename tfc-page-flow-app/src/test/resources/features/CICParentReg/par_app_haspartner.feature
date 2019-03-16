@cic_parent_reg
Feature: Is the CIC Parent Reg /par/app/haspartner page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Reg /par/app/haspartner page is correctly displayed
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/haspartner"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfTheHasPartnerIsTrue | NEXT | CIC Parent Reg | /par/app/partnerdetails |
    | IfTheHasPartnerIsFalseAndHasChildrenInSystem | NEXT | CIC Parent Reg | /par/app/childrensummary |
    | IfTheHasPartnerIsFalseAndNoChildrenInSystem | NEXT | CIC Parent Reg | /par/app/childsdetails |

Scenario: CIC Parent Reg page /par/app/haspartner with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/haspartner"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfTheHasPartnerIsTrue |
        | IfTheHasPartnerIsFalseAndHasChildrenInSystem |
        | IfTheHasPartnerIsFalseAndNoChildrenInSystem |

