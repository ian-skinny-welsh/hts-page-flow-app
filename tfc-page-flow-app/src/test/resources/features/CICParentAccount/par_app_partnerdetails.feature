Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/partnerdetails"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Account | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Account | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Account | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Account | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | CIC Parent Account | /par/app/childsname |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | CIC Parent Account | /par/app/childsdetails |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | CIC Parent Account | /par/app/childsdetails |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | CIC Parent Account | /par/app/childsname |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Account | /par/app/partneraddress |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Account | /par/app/partneraddress |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Account | /par/app/partneraddress |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Account | /par/app/partneraddress |

Scenario: CIC Parent Account page /par/app/partnerdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerDoesNotLiveAtSameAddress |
        | IfPartnerDoesNotLiveAtSameAddress |
        | IfPartnerDoesNotLiveAtSameAddress |
        | IfPartnerDoesNotLiveAtSameAddress |

