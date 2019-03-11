@parent_account
Feature: Is the Parent Account /par/app/disabilityquestions page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/disabilityquestions"

Scenario Outline: The next page from website Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | OnlyNoneOfTheseBenefitsOrCertificatesHaveBeenSelectedAndChildOver12 | NEXT | Parent Account | /par/app/childdetailserror |
    | CertificateOfVisualImpairmentHasBeenSelected | NEXT | Parent Account | /par/app/childvisualdisability |
    |  | NEXT | Parent Account | /par/app/claimedchildbenefit |

Scenario: Parent Account page /par/app/disabilityquestions with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | OnlyNoneOfTheseBenefitsOrCertificatesHaveBeenSelectedAndChildOver12 |
        | CertificateOfVisualImpairmentHasBeenSelected |

