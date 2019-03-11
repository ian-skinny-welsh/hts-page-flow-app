Feature: Is the Parent Account /par/acc/withdrawconfirmation page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/withdrawconfirmation"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | NEXT | Parent Account | /par/acc/childaccountsummary |
    |  | ONCHANGE | Parent Account | /par/acc/bankdetails |
    |  | ONCHANGEP | Parent Account | /par/acc/withdrawmoney |
    |  | ONCONFIRM | Parent Account | /par/acc/withdrawconfirmation/redirectpost |

