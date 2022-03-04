Feature: Managing the features available from the "SEQL Verification" Menu option

  Background:
    Given User is logged in PWB as AZ-ASAP-USER
    #subset of Formality officers as defined in the security group AZ-ASAP-USER
    And User is 'AS51431'
    And SEQL_Verification is open
    #meaning the user has clicked on the new PWB menu option "SEQL Verification"

  Scenario: List of suspended dossiers by the user
    Given SVS has dossiers with
      | Suspended Date | Status    | Dossier Number | Application Number | Suspended by User |
      | 28.09.2021     | suspended | EP18832833     | EP18832833         | AS51431           |
      | 30.09.2021     | suspended | NO139213       | NLA2013661         | AS51431           |
      | 04.10.2021     | suspended | SA1217904      | PCT/US2013/040627  | AS51431           |
      | 05.11.2021     | suspended | EP123456       | EP123456           | MV88467           |
    When User opens list of suspended dossiers
    Then system displays
      | Suspended Date | Dossier Number | Application Number |
      | 28.09.2021     | EP18832833     | EP18832833         |
      | 30.09.2021     | NO139213       | NLA2013661         |
      | 04.10.2021     | SA1217904      | PCT/US2013/040627  |
    #list of dossiers suspended by the user who has accessed the tool, in this case AS51431

  Scenario Outline: List of imported dossiers by the user on the selected date
    Given SVS has dossiers with
      | Reference | Imported Date | Status   | Dossier Number | Application Number | Submitted by User |
      | Id1       | 28.09.2021    | imported | EP18832833     | EP18832833         | AS51431           |
      | Id2       | 28.09.2021    | imported | EP12826154     | EP12826154         | AS51431           |
      | Id3       | 30.09.2021    | imported | NO139213       | NLA2013661         | AS51431           |
      | Id4       | 04.10.2021    | imported | SA1217904      | PCT/US2013/040627  | AS51431           |
      | Id5       | 05.11.2021    | imported | EP123456       | EP123456           | MV88467           |
    #The dossiers are technically NOT imported by the user. The SVS user will submit them for import.
    When User opens list of imported dossiers
    And Imported on date is <Date>
    Then system displays <Result set>
    Examples:
      | Date       | Result set |
      | 28.09.2021 | Id1, Id2   |
      | 04.10.2021 | Id4        |
      | 05.11.2021 |            |
    #list of dossiers submitted for import by the user who has accessed the tool, in this case AS51431, on the specific date