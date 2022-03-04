Feature: Managing the Sequence listing SVS task in PWB - Task Management

  Background:
    Given User is logged in PWB as AZ-ASAP-USER
    #subset of Formality officers as defined in the security group AZ-ASAP-USER
    And Task_Management is open

  Scenario Outline: Update Sequence listing information label for PCT and National dossiers
    Given User has claimed SVS task for <type> dossier
    And User has opened SVS task
    And SEQL_status is status1
    #status1 can be some of the possible status, e.g. new, preparing, verifying, etc.
    When User selects random label value
    #random label value can be any label available in the SEQL label drop down list
    Then SEQL_label shows selected label value
    And system creates a new entry in History table with today's date, User, status1 and SEQL_LABEL_NOTE comment
    #meaning that no matter which status the SEQL has, the status does not changed
    #final text of SEQL_LABEL_NOTE is indicated in GUI specifications
    Examples:
      | type |
      | PCT  |
      | NATS |

  Scenario: Creation of a comment
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User has opened SVS task
    And SEQL_status is status1
    #status1 can be some of the possible status, e.g. new, preparing, verifying, etc.
    When User enters comment
    #comment can be any text introduced in the text field and saved by the user
    Then system creates a new entry in History table with today's date, User, status1 and COMMENTS comment
    #meaning that no matter which status the SEQL has, the status does not changed
    #final text of COMMENTS is indicated in GUI specifications

  Scenario: Open a verification report
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User has opened SVS task
    And SVS task has Verification report
    #meaning that the report has been created, and therefore a "Verification report summary" is shown
    When User opens Verification window
    Then system opens Verification window showing Verification report and SEQL file
    #it is opened in a new browser window
    #left panel of the new browser window shows the verification report
    #right panel of the new browser window shows the SEQL file (in a readable form) for which the verification report was made

  Scenario: Navigation of the verification report
    Given Verification window is opened
    When User selects row of Verification report
    Then system scrolls and highlights relevant SEQL file section
    #meaning that the SEQL file section where the error/warning applies is highlighted

  Scenario: Uploading a SEQL file and verification of it
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User has opened SVS task
    When User uploads SEQL file
    #meaning that the user has uploaded a file and has pressed button "Upload and verify"
    Then system shows process started message
    #meaning that the user may see a "Verification started" message
    #this test finishes here, because the verification process may take some time

  Scenario: Submit valid sequence listings to the import queue
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User has opened SVS task
    When User submits valid SEQL file to import queue
    #meaning the user has clicked "Submit SEQL" and confirms the confirmation message
    #a "valid" SEQL file means a file without errors
    Then system sets SEQL_status to 'submitted'
    #the status of the SEQL should changed to "submitted"
    And system creates a new entry in History table with today's date, User, 'submitted' and SUBMITTED_INFO comment
    #final text of SUBMITTED_INFO is indicated in GUI specifications
    And system closes SVS task
    #the task is closed as soon as the user submits the SEQL
    #the task disappears from the list of tasks (inbox) and from the right panel where it was opened

  Scenario: Try to submit a sequence listings with errors
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User has opened SVS task
    When User submits invalid SEQL file to import queue
    #meaning the user has clicked "Submit SEQL"
    #an "invalid" SEQL file means a file with errors
    Then system shows SUBMIT_ERR message
    #final text of SUBMIT_ERR is indicated in GUI specifications

  Scenario Outline: Try to submit a sequence listings for PCT or National dossiers without label indicated
    Given User has claimed SVS task for <type> dossier
    And User has opened SVS task
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
    And User has opened SVS task
    When User sets SVS task to suspend
    #meaning the user presses the "Suspend" button of the task and confirms the confirmation message
    Then system stores today's date as Suspended date
    And system sets SEQL_status to 'suspended'
    #the status of the SEQL should changed to "suspended"
    And system set Suspended_date to today's date
    And system creates a new entry in History table with today's date, User, 'suspended' and SUSPENDED_TEXT comment
    #final text of SUSPENDED_TEXT is indicated in GUI specifications
    And system closes SVS task
    #the task is closed as soon as the user suspends the task
    #the task disappears from the list of tasks (inbox) and from the right panel where it was opened

  Scenario: Manual closing of the Sequence listing SVS task
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User has opened SVS task
    When User closes SVS task
    #meaning the user clicks on the option to close the task and confirms the confirmation message
    Then system sets SEQL_status to 'closed'
    #the status of the SEQL should changed to "closed"
    And system creates a new entry in History table with today's date, User, 'closed' and MANUALLY_CLOSED comment
    #final text of MANUALLY_CLOSED is indicated in GUI specifications
    And system closes SVS task
    #the task is closed as soon as the user manually closes the task
    #the task disappears from the list of tasks (inbox) and from the right panel where it was opened

  Scenario: Set task to pending
    Given User has claimed SVS task for a dossier
    #dossier can be any type of dossier: EP, PCT, NATS
    And User has opened SVS task
    When User enters comment
    #for a task to be set to pending a comment has to be included by the user
    And User sets SVS task to pending
    #meaning the user presses the "Set task to pending" button of the task and confirms the confirmation message
    Then system unclaims SVS task
    #the task is not closed (i.e. does not disappears from the list of tasks), but it is displayed in the "Unassigned" folder and the button "Claim" is displayed again