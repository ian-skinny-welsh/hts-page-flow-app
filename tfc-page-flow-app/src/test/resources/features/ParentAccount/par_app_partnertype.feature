@parent_account
Feature: Is the Parent Account /par/app/partnertype page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Account /par/app/partnertype page is correctly displayed
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/partnertype"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | Parent Account | /par/app/workstartdatepartner |
    | IfSelectedOwnCompanyDirector | NEXT | Parent Account | /par/app/workstartdatepartner |
    | IfSelectedSelfEmployed | NEXT | Parent Account | /par/app/partnerselfemploy |
    | IfOnlySelectedNotInEmployment | NEXT | Parent Account | /par/app/exit |
    | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits | NEXT | Parent Account | /par/app/exit |
    |  | NEXT | Parent Account | /par/app/otherleavepaytypepartner |

Scenario: Parent Account page /par/app/partnertype with action NEXT rules are ordered correctly
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/partnertype"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedSelfEmployed |
        | IfOnlySelectedNotInEmployment |
        | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits |

