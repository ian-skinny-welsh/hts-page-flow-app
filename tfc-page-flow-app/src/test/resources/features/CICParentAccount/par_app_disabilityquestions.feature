@cic_parent_account
Feature: Is the CIC Parent Account /par/app/disabilityquestions page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/disabilityquestions page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/disabilityquestions"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | OnlyNoneOfTheseBenefitsOrCertificatesHaveBeenSelectedAndChildOver12 | NEXT | CIC Parent Account | /par/app/childdetailserror |
    |  | NEXT | CIC Parent Account | /par/app/claimedchildbenefit |
    | CertificateOfVisualImpairmentHasBeenSelected | NEXT | CIC Parent Account | /par/app/childvisualdisability |
    |  | NEXT | CIC Parent Account | /par/app/claimedchildbenefit |

Scenario: CIC Parent Account page /par/app/disabilityquestions with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/disabilityquestions"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | OnlyNoneOfTheseBenefitsOrCertificatesHaveBeenSelectedAndChildOver12 |
        | CertificateOfVisualImpairmentHasBeenSelected |

