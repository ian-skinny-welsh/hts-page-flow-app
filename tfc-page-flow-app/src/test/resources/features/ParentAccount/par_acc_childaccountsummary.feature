Feature: Is the page correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/childaccountsummary"

Scenario Outline: The next page from website Parent Account is correctly displayed
    Given the user has visited "<fromWebsite>" website
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | MaxCCPLimitReached | ADDCCP | Parent Account | /par/acc/selectionerror |
    |  | ADDCCP | Parent Account | /par/acc/ccpselection |
    |  | ADDHMRC | Parent Account | /par/acc/childaccountsummary |
    | CCPIsPAYE | CHANGECCP | Parent Account | /par/acc/editpaypaye |
    |  | CHANGECCP | Parent Account | /par/acc/paymentseditforchild |
    | ParentHasBankDetails | MAKEWITHDR | Parent Account | /par/acc/withdrawmoney |
    |  | MAKEWITHDR | Parent Account | /par/acc/bankdetails |
    | CCPIsBlockedOrSuspended | PAYCCP | Parent Account | /par/acc/blockedpayment |
    | CCPIsPAYE | PAYCCP | Parent Account | /par/acc/paypaye |
    |  | PAYCCP | Parent Account | /par/acc/paymentsnewforchild |
    |  | PAYIN | Parent Account | /par/acc/paymoneyinbankdetails |
    |  | REMOVECCP | Parent Account | /par/acc/removalconfirmation |

Scenario: Parent Account page /par/acc/childaccountsummary with action CHANGECCP rules are ordered correctly
    When the user clicks "CHANGECCP"
    Then these rules are executed in order:
        | CCPIsPAYE |

Scenario: Parent Account page /par/acc/childaccountsummary with action ADDCCP rules are ordered correctly
    When the user clicks "ADDCCP"
    Then these rules are executed in order:
        | MaxCCPLimitReached |

Scenario: Parent Account page /par/acc/childaccountsummary with action PAYCCP rules are ordered correctly
    When the user clicks "PAYCCP"
    Then these rules are executed in order:
        | CCPIsBlockedOrSuspended |
        | CCPIsPAYE |

Scenario: Parent Account page /par/acc/childaccountsummary with action MAKEWITHDR rules are ordered correctly
    When the user clicks "MAKEWITHDR"
    Then these rules are executed in order:
        | ParentHasBankDetails |

