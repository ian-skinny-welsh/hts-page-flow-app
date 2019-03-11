Feature: Is the Parent Account /par/acc/accounthomepage page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Account" website
    And the user is on page "/par/acc/accounthomepage"

Scenario Outline: The next page from website Parent Account is correctly displayed
	And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
	And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    |  | ADMINDET | Parent Account | /par/acc/mydetails |
    |  | CHANGEACC | Parent Account | /par/acc/accountselect |
    |  | FREEENTITL | Parent Account | /par/acc/freeentitlement |
    | AdditionalChildBlocked | NEWCHLDAPP | Parent Account | /par/acc/cantacceptnewapp |
    | HasMatchingFailure | NEWCHLDAPP | Parent Account | /par/acc/matchingfailure |
    | IsReconfirmationRequired | NEWCHLDAPP | Parent Account | /par/acc/reconfirmationrequired |
    | IfOnHoldApplicationsFound | NEWCHLDAPP | Parent Account | /par/app/childrensummary |
    |  | NEWCHLDAPP | Parent Account | /par/app/childsdetails |
    |  | NEWCHLDAPP | Parent Account | /par/app/childsname |
    | HasMatchingFailure | RECONFIRMA | Parent Account | /par/acc/matchingfailure |
    | IfParentHasReconfirmedAndInReconfirmWindow | RECONFIRMA | Parent Account | /par/acc/alreadyreconfirmed |
    | BeforeWindowOpen | RECONFIRMA | Parent Account | /par/acc/reconfwindowclosed |
    | ReconfirmationBlocked | RECONFIRMA | Parent Account | /par/acc/cantacceptnewapp |
    | AfterWindowCloses | RECONFIRMA | Parent Account | /par/acc/reconfirmationinfo |
    |  | RECONFIRMA | Parent Account | /par/acc/reconfirmationinfo |
    |  | REPRESENTA | Parent Account | /par/acc/representativeintro |
    |  | SECUREMSG | Parent Account | /par/acc/securemessages |
    |  | SECURITY | Parent Account | /par/acc/securityselection |
    | IsParentAccountFrozen | YOURACC | Parent Account | /par/acc/parentaccountfrozen |
    | HasNewlyPayOnlyChildren | YOURACC | Parent Account | /par/acc/payonlywarning |
    |  | YOURACC | Parent Account | /par/acc/accountsummary |
    |  | YOURAPPS | Parent Account | /par/acc/yourapplications |
    | IsSignedInAsRepAndHasNotChangeContactDetailsPermission | YOURDETAIL | Parent Account | /par/acc/repcontactdetails |
    | IsSignedInAsRepAndHasChangeContactDetailsPermission | YOURDETAIL | Parent Account | /par/acc/contactdetailsselect |
    |  | YOURDETAIL | Parent Account | /par/acc/mydetails |

Scenario: Parent Account page /par/acc/accounthomepage with action NEWCHLDAPP rules are ordered correctly
    When the user clicks "NEWCHLDAPP"
    Then these rules are executed in order:
        | AdditionalChildBlocked |
        | HasMatchingFailure |
        | IsReconfirmationRequired |
        | IfOnHoldApplicationsFound |

Scenario: Parent Account page /par/acc/accounthomepage with action YOURDETAIL rules are ordered correctly
    When the user clicks "YOURDETAIL"
    Then these rules are executed in order:
        | IsSignedInAsRepAndHasNotChangeContactDetailsPermission |
        | IsSignedInAsRepAndHasChangeContactDetailsPermission |

Scenario: Parent Account page /par/acc/accounthomepage with action YOURACC rules are ordered correctly
    When the user clicks "YOURACC"
    Then these rules are executed in order:
        | IsParentAccountFrozen |
        | HasNewlyPayOnlyChildren |

Scenario: Parent Account page /par/acc/accounthomepage with action RECONFIRMA rules are ordered correctly
    When the user clicks "RECONFIRMA"
    Then these rules are executed in order:
        | HasMatchingFailure |
        | IfParentHasReconfirmedAndInReconfirmWindow |
        | BeforeWindowOpen |
        | ReconfirmationBlocked |
        | AfterWindowCloses |

