@cic_parent_account
Feature: Is the CIC Parent Account /par/acc/accounthomepage page navigation correct?
  Is the correct page returned

Scenario Outline: The next page from CIC Parent Account /par/acc/accounthomepage page is correctly displayed
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/accounthomepage"
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | ADMINDET | CIC Parent Account | /par/acc/mydetails |
    |  | CHANGEACC | CIC Parent Account | /par/acc/accountselect |
    |  | CICAPI9DCL | CIC Parent Account | /par/acc/matchingfailure |
    |  | FREEENTITL | CIC Parent Account | /par/acc/freeentitlement |
    | AdditionalChildBlocked | NEWCHLDAPP | CIC Parent Account | /par/acc/cantacceptnewapp |
    | HasMatchingFailure | NEWCHLDAPP | CIC Parent Account | /par/acc/matchingfailure |
    | IsReconfirmationRequired | NEWCHLDAPP | CIC Parent Account | /par/acc/reconfirmationrequired |
    | IfOnHoldApplicationsFound | NEWCHLDAPP | CIC Parent Account | /par/app/childrensummary |
    |  | NEWCHLDAPP | CIC Parent Account | /par/acc/newchild |
    | HasMatchingFailure | RECONFIRMA | CIC Parent Account | /par/acc/matchingfailure |
    | IfParentHasReconfirmedAndInReconfirmWindow | RECONFIRMA | CIC Parent Account | /par/acc/alreadyreconfirmed |
    | BeforeWindowOpen | RECONFIRMA | CIC Parent Account | /par/acc/reconfwindowclosed |
    | ReconfirmationBlocked | RECONFIRMA | CIC Parent Account | /par/acc/cantacceptnewapp |
    | AfterWindowCloses | RECONFIRMA | CIC Parent Account | /par/acc/reconfirmationinfo |
    |  | RECONFIRMA | CIC Parent Account | /par/acc/reconfirmationinfo |
    |  | REPRESENTA | CIC Parent Account | /par/acc/representativeintro |
    |  | RTRNASTPAR | CIC Parent Account | /par/acc/assistparent |
    |  | SECUREMSG | CIC Parent Account | /par/acc/securemessages |
    |  | SECURITY | CIC Parent Account | /par/acc/securityselection |
    | IsParentAccountFrozen | YOURACC | CIC Parent Account | /par/acc/parentaccountfrozen |
    | HasNewlyPayOnlyChildren | YOURACC | CIC Parent Account | /par/acc/payonlywarning |
    |  | YOURACC | CIC Parent Account | /par/acc/accountsummary |
    |  | YOURAPPS | CIC Parent Account | /par/acc/yourapplications |
    | IsSignedInAsRepAndHasNotChangeContactDetailsPermission | YOURDETAIL | CIC Parent Account | /par/acc/repcontactdetails |
    | IsSignedInAsRepAndHasChangeContactDetailsPermission | YOURDETAIL | CIC Parent Account | /par/acc/contactdetailsselect |
    |  | YOURDETAIL | CIC Parent Account | /par/acc/mydetails |

Scenario: CIC Parent Account page /par/acc/accounthomepage with action NEWCHLDAPP rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/accounthomepage"
    When the user clicks "NEWCHLDAPP"
    Then these rules are executed in order:
        | AdditionalChildBlocked |
        | HasMatchingFailure |
        | IsReconfirmationRequired |
        | IfOnHoldApplicationsFound |

Scenario: CIC Parent Account page /par/acc/accounthomepage with action YOURDETAIL rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/accounthomepage"
    When the user clicks "YOURDETAIL"
    Then these rules are executed in order:
        | IsSignedInAsRepAndHasNotChangeContactDetailsPermission |
        | IsSignedInAsRepAndHasChangeContactDetailsPermission |

Scenario: CIC Parent Account page /par/acc/accounthomepage with action YOURACC rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/accounthomepage"
    When the user clicks "YOURACC"
    Then these rules are executed in order:
        | IsParentAccountFrozen |
        | HasNewlyPayOnlyChildren |

Scenario: CIC Parent Account page /par/acc/accounthomepage with action RECONFIRMA rules are ordered correctly
    Given the user has visited "CIC Parent Account" website
    And the user is on page "/par/acc/accounthomepage"
    When the user clicks "RECONFIRMA"
    Then these rules are executed in order:
        | HasMatchingFailure |
        | IfParentHasReconfirmedAndInReconfirmWindow |
        | BeforeWindowOpen |
        | ReconfirmationBlocked |
        | AfterWindowCloses |

