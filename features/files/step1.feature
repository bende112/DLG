Feature: checks to see if a vehicle exists

  Scenario: Drive Away Insurance page
    Given I visit ""
    And the "Drive Away Insurance" page is displayed
    And i enter a registration number "OV12UYY"
    When i click on the "Find vehicle" button
    Then the result for the registration number "OV12UYY" is displayed
    And the cover start date "09 FEB 2022 : 16 : 26" with cover end date "18 FEB 2022 : 23 : 59" is displayed


  Scenario: vehicle does not exists
    Given I visit ""
    And the "Drive Away Insurance" page is displayed
    And i enter a registration number "OY12VXX"
    When i click on the "Find vehicle" button
    Then the the car does not exist with a message "Sorry record not found" is displayed

  Scenario: error validation
    Given I visit ""
    And the "Drive Away Insurance" page is displayed
    When i click on the "Find vehicle" button
    Then the a message "Please enter a valid car registration" is displayed

