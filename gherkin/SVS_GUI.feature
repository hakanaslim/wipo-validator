Feature: Managing the Sequence listing SVS task in PWB

  Background:
    Given User is logged in PWB as AZ-ASAP-USER
    #subset of Formality officers as defined in the security group AZ-ASAP-USER
    And PWB is open

  Scenario Outline: Update Sequence listing information label for PCT and National dossiers
    Given User has claimed SVS task for <type> dossier
    And User opens SVS task
    When User selects random label value
    #random label value can be any label available in the SEQL label drop down list
    Then SEQL_label shows selected label value
    And Previous_actions table shows new entry with User, today's date and SEQL_LABEL_NOTE comment
    #final text of SEQL_LABEL_NOTE is indicated in GUI specifications
    Examples:
      | type |
      | PCT  |
      | NATS |

  Scenario: Creation of a comment
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User opens SVS task
    When User enters comment
    #comment can be any text introduced in the text field and saved by the user
    Then Previous_actions table shows new entry with User, today's date and COMMENTS comment
    #final text of COMMENTS is indicated in GUI specifications

  Scenario: Open a verification report
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User opens SVS task
    And SVS task has Verification report
    #meaning, for instance, that "Open report" button is available and a "Verification report summary" is shown
    When User opens Verification report
    Then Verification report is open
    #it is opened in a new browser window
    And Left Pane shows Verification report
    #left panel of the new browser window shows the verification report
    And Right Pane shows SEQL file
    #right panel of the new browser window shows the SEQL file (in a readable form) for which the verification report was made

  Scenario: Navigation of the verification report
    Given Verification report is open
    When User selects row of Verification report
    Then system scrolls and highlights relevant SEQL file section
    #meaning that the SEQL file section where the error/warning applies is highlighted

  Scenario: Uploading a SEQL file and verification of it
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User opens SVS task
    When User uploads SEQL file
    #meaning that the user has uploaded a file and has pressed button "Upload SEQL and verify"
    Then system shows process started message
    #meaning that the user may see a "Verification started" message
    #this test finishes here, because the verification process may take some time

  Scenario: Submit valid sequence listings to the import queue
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User opens SVS task
    When User submits valid SEQL file to import queue
    #meaning the user has clicked "Submit SEQL"
    #a "valid" SEQL file means a file without errors
    And User confirms submission
    #meaning the user has continued with the submission (i.e. has pressed Submit button of confirmation message)
    Then Previous_actions table shows new entry with User, today's date and SUBMITTED_INFO comment
    #final text of SUBMITTED_INFO is indicated in GUI specifications

  Scenario: Try to submit a sequence listings with errors
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User opens SVS task
    When User submits invalid SEQL file to import queue
    #meaning the user has clicked "Submit SEQL"
    #an "invalid" SEQL file means a file with errors
    Then system shows SUBMIT_ERR message
    #final text of SUBMIT_ERR is indicated in GUI specifications

  Scenario Outline: Try to submit a sequence listings for PCT or National dossiers without label indicated
    Given User has claimed SVS task for <type> dossier
    And User opens SVS task
    And SVS task shows SEQL_label empty
    #meaning no SEQL label has been assigned to the task
    When User submits valid SEQL file to import queue
    #meaning the user has clicked "Submit SEQL"
    #a "valid" SEQL file means one without errors or warnings
    Then system shows SUBMIT_NO_SEQL_LABEL message
    #final text of SUBMIT_NO_SEQL_LABEL is indicated in GUI specifications
    Examples:
      | type |
      | PCT  |
      | NATS |

  Scenario: Set a sequence listing to Suspend
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User opens SVS task
    When User sets SVS task to suspend
    #meaning the user presses in the "Suspend" button of the task
    Then Suspended label shows today's date
    And Previous_actions table shows new entry with User, today's date and SUSPENDED_TEXT comment
    #final text of SUSPENDED_TEXT is indicated in GUI specifications

  Scenario: Manual closing of the Sequence listing SVS task
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User opens SVS task
    When User closes SVS task
    #meaning the user clicks on the option to close the task that appears inside its GUI
    Then SVS task is not shown in Examination tray
    #the task disappears from the list of tasks (inbox) and from the right panel where it was opened
    And SVS task is shown in History tray
    #the task goes to the History tray