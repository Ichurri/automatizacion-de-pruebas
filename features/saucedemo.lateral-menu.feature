Feature: Saucedemo lateral menu
    As a user authenticated in SauceDemo 
    I want to be able to navigate using the lateral menu 
    To access the different functionalities of the application

Background:
    Given I am on the login page
    When I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button
    Then I should be able to see the main page with the catalog of products
    And I should see the lateral menu available

    @menu
    Scenario: Navigate to All Items from lateral menu
        Given I am on the Products page
        When I click on the lateral menu button
        And I click on "All Items" option
        Then I should be able to see the main page with the catalog of products
        And I should see all available products in the inventory

    @menu
    Scenario: Navigate to About page from lateral menu
        Given I am on the Products page
        When I click on the lateral menu button
        And I click on "About" option
        Then I should be redirected to "https://saucelabs.com/"
        And I should see the Sauce Labs company information

    @menu
    @smoke
    Scenario: Logout using lateral menu
        Given I am on the Products page
        When I click on the lateral menu button
        And I click on "Logout" option
        Then I should be redirected to the login page
        And I should see the following fields empty:
            | field     | value  |
            | Username  |        |
            | Password  |        |
        And I should not have access to protected pages like:
            | page                     |
            | /inventory.html          |
            | /cart.html               |
            | /checkout-step-one.html |

    @menu
    Scenario: Reset application state using lateral menu
        Given I am on the Products page
        And I click the Add to cart for the item "backpack"
        And the cart icon should show 1 items
        When I click on the lateral menu button
        And I click on "Reset App State" option
        Then the cart icon should not be visible
        And I should remain on the current page
        And all filters should be reset to default

    @menu
    Scenario: Verify lateral menu opens and displays all options
        Given I am on the Products page
        When I click on the lateral menu button
        Then I should see the following options in the menu:
            | option           |
            | All Items        |
            | About            |
            | Logout           |
            | Reset App State  |
        And all menu options should be clickable

    @menu
    Scenario Outline: Validate individual lateral menu options are visible
        Given I am on the Products page
        When I click on the lateral menu button
        Then I should see "<option>" option in the menu
        And the "<option>" option should be clickable

    Examples:
        | option          |
        | All Items       |
        | About           |
        | Logout          |
        | Reset App State |
