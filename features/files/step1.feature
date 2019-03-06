Feature: landing page

  Scenario: Drive Away Insurance page
    Given I visit ""
    And the "Drive Away Insurance" page is displayed
    And i enter a registration number "OV12UYY"
    When i click on the "Find vehicle" button
    Then the result for the registration number "OV12UYY" is displayed
    And the cover start date "09 FEB 2022 : 16 : 26" with cover end date "18 FEB 2022 : 23 : 59" is displayed