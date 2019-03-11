Feature: Is the CIC Parent Account /par/acc/childaccountsummary page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/childaccountsummary"

Scenario Outline: The next page from website CIC Parent Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | MaxCCPLimitReached | ADDCCP | CIC Parent Account | /par/acc/selectionerror |
    |  | ADDCCP | CIC Parent Account | /par/acc/ccpselection |
    |  | ADDHMRC | CIC Parent Account | /par/acc/childaccountsummary |
    | CCPIsPAYE | CHANGECCP | CIC Parent Account | /par/acc/editpaypaye |
    |  | CHANGECCP | CIC Parent Account | /par/acc/paymentseditforchild |
    | ParentHasBankDetails | MAKEWITHDR | CIC Parent Account | /par/acc/withdrawmoney |
    |  | MAKEWITHDR | CIC Parent Account | /par/acc/bankdetails |
    | CCPIsBlockedOrSuspended | PAYCCP | CIC Parent Account | /par/acc/blockedpayment |
    | CCPIsPAYE | PAYCCP | CIC Parent Account | /par/acc/paypaye |
    |  | PAYCCP | CIC Parent Account | /par/acc/paymentsnewforchild |
    |  | PAYIN | CIC Parent Account | /par/acc/paymoneyinbankdetails |
    |  | REMOVECCP | CIC Parent Account | /par/acc/removalconfirmation |

Scenario: CIC Parent Account page /par/acc/childaccountsummary with action CHANGECCP rules are ordered correctly
    When the user clicks "CHANGECCP"
    Then these rules are executed in order:
        | CCPIsPAYE |

Scenario: CIC Parent Account page /par/acc/childaccountsummary with action ADDCCP rules are ordered correctly
    When the user clicks "ADDCCP"
    Then these rules are executed in order:
        | MaxCCPLimitReached |

Scenario: CIC Parent Account page /par/acc/childaccountsummary with action PAYCCP rules are ordered correctly
    When the user clicks "PAYCCP"
    Then these rules are executed in order:
        | CCPIsBlockedOrSuspended |
        | CCPIsPAYE |

Scenario: CIC Parent Account page /par/acc/childaccountsummary with action MAKEWITHDR rules are ordered correctly
    When the user clicks "MAKEWITHDR"
    Then these rules are executed in order:
        | ParentHasBankDetails |

