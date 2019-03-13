@cic_parent_account
Feature: Is the CIC Parent Account /par/app/parenttype page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/parenttype page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/parenttype"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | CIC Parent Account | /par/app/workstartdate |
    | IfSelectedOwnCompanyDirector | NEXT | CIC Parent Account | /par/app/parentselfemploy |
    | IfSelectedSelfEmployed | NEXT | CIC Parent Account | /par/app/parentselfemploy |
    | IfOnlySelectedBenefitsAndNoPartner | NEXT | CIC Parent Account | /par/app/exit |
    |  | NEXT | CIC Parent Account | /par/app/otherleavepaytype |

Scenario: CIC Parent Account page /par/app/parenttype with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/parenttype"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedSelfEmployed |
        | IfOnlySelectedBenefitsAndNoPartner |

