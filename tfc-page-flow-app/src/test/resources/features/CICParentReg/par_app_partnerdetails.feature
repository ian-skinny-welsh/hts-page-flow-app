Feature: Is the CIC Parent Reg /par/app/partnerdetails page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Reg" website
    And the user is on page "/par/app/partnerdetails"

Scenario Outline: The next page from website CIC Parent Reg is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Reg | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Reg | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Reg | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | CIC Parent Reg | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | CIC Parent Reg | /par/app/childsdetails |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | CIC Parent Reg | /par/app/childsdetails |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Reg | /par/app/partneraddress |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Reg | /par/app/partneraddress |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Reg | /par/app/partneraddress |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | CIC Parent Reg | /par/app/partneraddress |

Scenario: CIC Parent Reg page /par/app/partnerdetails with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerDoesNotLiveAtSameAddress |
        | IfPartnerDoesNotLiveAtSameAddress |
        | IfPartnerDoesNotLiveAtSameAddress |
        | IfPartnerDoesNotLiveAtSameAddress |

