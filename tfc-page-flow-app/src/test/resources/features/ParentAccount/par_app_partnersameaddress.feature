Feature: Is the Parent Account /par/app/partnersameaddress page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/app/partnersameaddress"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | Parent Account | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | Parent Account | /par/app/childsdetails |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | Parent Account | /par/app/childsname |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | Parent Account | /par/app/partneraddress |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | Parent Account | /par/app/partneraddress |

Scenario: Parent Account page /par/app/partnersameaddress with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerDoesNotLiveAtSameAddress |
        | IfPartnerDoesNotLiveAtSameAddress |

