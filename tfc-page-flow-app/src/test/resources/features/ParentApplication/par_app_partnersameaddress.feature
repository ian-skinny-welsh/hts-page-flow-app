@parent_application
Feature: Is the Parent Application /par/app/partnersameaddress page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from Parent Application /par/app/partnersameaddress page is correctly displayed
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnersameaddress"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | IfPartnerLivesAtSameAddressAndHasChildrenInSystem | NEXT | Parent Application | /par/app/childrensummary |
    | IfPartnerLivesAtSameAddressAndNoChildrenInSystem | NEXT | Parent Application | /par/app/childsname |
    | IfPartnerDoesNotLiveAtSameAddress | NEXT | Parent Application | /par/app/partneraddress |

Scenario: Parent Application page /par/app/partnersameaddress with action NEXT rules are ordered correctly
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/partnersameaddress"
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | IfPartnerLivesAtSameAddressAndHasChildrenInSystem |
        | IfPartnerLivesAtSameAddressAndNoChildrenInSystem |
        | IfPartnerDoesNotLiveAtSameAddress |

