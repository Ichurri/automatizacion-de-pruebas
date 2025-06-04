Feature: Saucedemo hamburger menu
    As a user authenticated in SauceDemo 
    I want to be able to navigate using the hamburger menu 
    To access the different functionalities of the application
    
Background:
    Given I am on the login page
    When I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button
    Then I should be able to see the Product page
    And I should see the hamburger menu available

Scenario: Navigate to All Items from hamburger menu
    Given I am on the homepage
    When I click on the hamburger menu button
    And I click on "All Items" option
    Then I should be able to see the Product page
    And I should see all available products in the inventory

Scenario: Navigate to About page from hamburger menu
    Given I am on the homepage
    When I click on the hamburger menu button
    And I click on "About" option
    Then I should be redirected to "https://saucelabs.com/"
    And I should see the Sauce Labs company information

Scenario: Logout using hamburger menu
    Given I am on the homepage
    When I click on the hamburger menu button
    And I click on "Logout" option
    Then I should be redirected to the login page
    And I should see empty username and password fields
    And I should not have access to protected pages

Scenario: Reset application state using hamburger menu
    Given I am on the homepage
    And I click the Add to cart for the item "backpack"
    And the cart icon should show 1 items
    When I click on the hamburger menu button
    And I click on "Reset App State" option
    Then the cart icon should not be visible
    And I should remain on the current page
    And all filters should be reset to default

Scenario: Verify hamburger menu opens and displays all options
    Given I am on the homepage
    When I click on the hamburger menu button
    Then I should see "All Items" option in the menu
    And I should see "About" option in the menu
    And I should see "Logout" option in the menu
    And I should see "Reset App State" option in the menu
    And all menu options should be clickable

Scenario Outline: Validate individual hamburger menu options are visible
    Given I am on the homepage
    When I click on the hamburger menu button
    Then I should see "<option>" option in the menu
    And the "<option>" option should be clickable

Examples:
    | option          |
    | All Items       |
    | About           |
    | Logout          |
    | Reset App State |