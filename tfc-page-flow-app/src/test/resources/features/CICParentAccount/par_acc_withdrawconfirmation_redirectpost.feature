Feature: Is the CIC Parent Account /par/acc/withdrawconfirmation/redirectpost page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/withdrawconfirmation/redirectpost"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | ONCONFIRM | CIC Parent Account | /par/acc/withdrawauthorised |

