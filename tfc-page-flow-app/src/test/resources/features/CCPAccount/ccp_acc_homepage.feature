Feature: Is the CCP Account /ccp/acc/homepage page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "CCP Account" website
    And the user is on page "/ccp/acc/homepage"

Scenario Outline: The next page from website CCP Account is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | isMODAndIfCCPCountryIsNotUK | BANKACC | CCP Account | /ccp/acc/nonukbankdetails |
    |  | BANKACC | CCP Account | /ccp/acc/updatebankdetails |
    | ifDelegateExist | DELEGCONT | CCP Account | /ccp/acc/delegateaction |
    |  | DELEGCONT | CCP Account | /ccp/acc/nominateadelegate |
    |  | IDENTIFYPY | CCP Account | /ccp/acc/ccppaymentssearch |
    |  | MAINCONTAC | CCP Account | /ccp/acc/maincontactdetails |
    | isRsaBlocked | SECURITY | CCP Account | /ccp/acc/rsaquestionswarning |
    |  | SECURITY | CCP Account | /ccp/acc/security |

Scenario: CCP Account page /ccp/acc/homepage with action DELEGCONT rules are ordered correctly
    When the user clicks "DELEGCONT"
    Then these rules are executed in order:
        | ifDelegateExist |

Scenario: CCP Account page /ccp/acc/homepage with action BANKACC rules are ordered correctly
    When the user clicks "BANKACC"
    Then these rules are executed in order:
        | isMODAndIfCCPCountryIsNotUK |

Scenario: CCP Account page /ccp/acc/homepage with action SECURITY rules are ordered correctly
    When the user clicks "SECURITY"
    Then these rules are executed in order:
        | isRsaBlocked |

