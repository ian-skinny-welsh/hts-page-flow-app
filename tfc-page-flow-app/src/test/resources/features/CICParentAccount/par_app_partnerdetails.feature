@cic_parent_account
Feature: Is the CIC Parent Account /par/app/partnerdetails page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/app/partnerdetails page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/partnerdetails"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Account | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | CIC Parent Account | /par/app/childsdetails |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Account | /par/app/partneraddress |

Scenario: CIC Parent Account page /par/app/partnerdetails with action NEXT rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/partnerdetails"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerDoesNotLiveAtSameAddress |

