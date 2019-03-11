Feature: Is the Parent Application /par/app/tfcentrypoint page navigation correct?
  Is the correct page returned

Background:
    Given the user has visited "Parent Application" website
    And the user is on page "/par/app/tfcentrypoint"

Scenario Outline: The next page from website Parent Application is correctly displayed
    And the rule "<rule>" succeeds
    When the user clicks "<action>"
    Then the user is on "<to website>" website
    And the page "<to url>" is displayed

Examples:
    | rule | action | to website | to url |
    | Api30THValidationFailedNavRule | NEXT | Parent Application | /par/app/matchingfailed3 |
    | Api30PDValidationFailedNavRule | NEXT | Parent Application | /par/app/matchingfailed1 |
    | Api30DDValidationFailedNavRule | NEXT | Parent Application | /par/app/matchingfailed2 |
    | ParentIdaHasApplicationNavRule | NEXT | Parent Application | /par/acc/entrypointpost |
    | ParentIdaHasApplicationNavRule | NEXT | Parent Application | /par/app/entrypointpost |
    | ParentIdaHasApplicationNavRule | NEXT | Parent Application | /ccp/acc/entrypointpost |
    |  | NEXT | Parent Application | /par/acc/entrypointpost |
    |  | NEXT | Parent Application | /par/app/entrypointpost |
    |  | NEXT | Parent Application | /ccp/acc/entrypointpost |

Scenario: Parent Application page /par/app/tfcentrypoint with action NEXT rules are ordered correctly
    When the user clicks "NEXT"
    Then these rules are executed in order:
        | Api30THValidationFailedNavRule |
        | Api30PDValidationFailedNavRule |
        | Api30DDValidationFailedNavRule |
        | ParentIdaHasApplicationNavRule |
        | ParentIdaHasApplicationNavRule |
        | ParentIdaHasApplicationNavRule |

