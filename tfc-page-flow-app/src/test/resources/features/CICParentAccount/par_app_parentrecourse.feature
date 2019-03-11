Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/app/parentrecourse"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | EntitledForPublicFounds | NEXT | CIC Parent Account | /par/app/parentdetails |
    | EntitledForPublicFounds | NEXT | CIC Parent Account | /par/app/parentdetails |
    | EntitledForPublicFounds | NEXT | CIC Parent Account | /par/app/parentdetails |
    | EntitledForPublicFounds | NEXT | CIC Parent Account | /par/app/parentdetails |
    |  | NEXT | CIC Parent Account | /par/app/exit |
    |  | NEXT | CIC Parent Account | /par/app/exit |

Scenario: CIC Parent Account page /par/app/parentrecourse with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | EntitledForPublicFounds |
        | EntitledForPublicFounds |
        | EntitledForPublicFounds |
        | EntitledForPublicFounds |

