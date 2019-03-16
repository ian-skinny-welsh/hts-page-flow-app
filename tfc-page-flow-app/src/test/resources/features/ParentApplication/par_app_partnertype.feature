@parent_application
Feature: Is the Parent Application /par/app/partnertype page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/partnertype page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnertype"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days | NEXT | Parent Application | /par/app/workstartdatepartner |
    | IfSelectedOwnCompanyDirector | NEXT | Parent Application | /par/app/workstartdatepartner |
    | IfSelectedSelfEmployed | NEXT | Parent Application | /par/app/partnerselfemploy |
    | IfOnlySelectedNotInEmployment | NEXT | Parent Application | /par/app/exit |
    | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits | NEXT | Parent Application | /par/app/exit |
    |  | NEXT | Parent Application | /par/app/otherleavepaytypepartner |

Scenario: Parent Application page /par/app/partnertype with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnertype"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfSelectedPaidEmploymentOrDueToStartInTheNext14Days |
        | IfSelectedOwnCompanyDirector |
        | IfSelectedSelfEmployed |
        | IfOnlySelectedNotInEmployment |
        | IfOnlySelectedBenefitsAndParentOnlySelectedBenefits |

