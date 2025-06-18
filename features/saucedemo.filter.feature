Feature: Filter items
    As a user authenticated in SauceDemo 
    I want to be able to filter the products of the inventory 
    To easily find the products I am looking for according to different criteria

Background:
    Given I am on the login page
    And I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button
    And I click the Add to cart for the item "Sauce Labs Backpack"
    And I should see all available products displayed
    And I should see the filter dropdown is available
    And I am on the inventory page


Scenario: Filter products by name from A to Z
    When I click on the filter dropdown
    And I select "Name (A to Z)"
    Then the products should be sorted alphabetically from A to Z
    And the filter dropdown should display "Name (A to Z)" as selected
    And the first product name should start with a letter that comes before the last product name alphabetically


Scenario: Filter products by name from Z to A
    When I click on the filter dropdown
    And I select "Name (Z to A)"
    Then the products should be sorted alphabetically from Z to A in descending order
    And the first product name should start with a letter that comes after the last product name alphabetically
    And the filter dropdown should display "Name (Z to A)" as selected


Scenario: Filter products by price from low to high
    When I click on the filter dropdown
    And I select "Price (low to high)"
    Then the products should be sorted by price in ascending order
    And each product price should be less than or equal to the next product price
    And the filter dropdown should display "Price (low to high)" as selected


Scenario: Filter products by price from high to low
    When I click on the filter dropdown
    And I select "Price (high to low)"
    Then the products should be sorted by price in descending order
    And each product price should be greater than or equal to the next product price
    And the filter dropdown should display "Price (high to low)" as selected


Scenario: Switch between different filters
    Given I have applied the "Name (A to Z)" filter
    When I change the filter to "Price (low to high)"
    Then the products should be reordered according to price from low to high
    And the filter dropdown should show "Price (low to high)" as selected
    And all products should remain visible with the new sorting applied


Scenario Outline: Verify that filters maintain all products visible
    Given I count the total number of products displayed on the page
    When I apply the "<filter>" filter
    Then I should see the exact same number of products as before filtering
    And no product should be hidden or duplicated
    And only the display order of the products should change

Examples:
  | filter              |
  | Name (A to Z)       |
  | Name (Z to A)       |
  | Price (low to high) |
  | Price (high to low) |


Scenario Outline: Validate all filter options are available and selectable
    When I click on the filter dropdown
    Then I should see the option "<filter_option>" in the dropdown list
    And I should be able to click and select "<filter_option>"

Examples:
  | filter_option       |
  | Name (A to Z)       |
  | Name (Z to A)       |
  | Price (low to high) |
  | Price (high to low) |


Scenario: Verify default product order when first loading the page
    Given I am on the inventory page for the first time
    Then the products should be displayed in alphabetical order by name (A to Z)
    And the filter dropdown should show "Name (A to Z)" as the default selection
    And all available products should be visible


Scenario: Validate correct alphabetical ordering A to Z
    When I apply the "Name (A to Z)" filter
    Then the product "Sauce Labs Backpack" should appear before "Sauce Labs Onesie" in the list
    And all product names should be in strict alphabetical ascending order
    And no product should be out of alphabetical sequence


Scenario: Validate correct price ordering from low to high
    When I apply the "Price (low to high)" filter
    Then I should extract the price values from all visible products
    And each product price should be numerically less than or equal to the following product price
    And the product with the lowest price should appear first in the list
    And the product with the highest price should appear last in the list


Scenario: Verify filter selection persists after product navigation
    Given I have applied the "Price (high to low)" filter
    And the products are sorted by price from high to low
    When I click on any product to view its details page
    And I click the "Back to products" button to return to inventory
    Then the filter dropdown should still show "Price (high to low)" as selected
    And the products should maintain their descending price order