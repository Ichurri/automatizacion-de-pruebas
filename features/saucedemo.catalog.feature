Feature: Catalog interaction
  As a Saucedemo user
  I want to interact with the product catalog
  So I can add items to my shopping cart

  Background:
    Given I am on the login page
    And I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button

    @maximize
    @catalog
    Scenario: Add item to cart from the catalog
      Given I am on the homepage
      When I click the Add to cart for the item "backpack"
      Then the cart icon should show 1 items

    @maximize
    @catalog
    Scenario: Remove item from cart in the catalog page
      Given I am on the homepage
      When I click the Add to cart for the item "backpack"
      And I click the Remove button for the item "backpack"
      Then the cart icon should not be visible

    @maximize
    @catalog
    Scenario: View item details before adding to cart
      Given I am on the homepage
      When I click the item name Sauce Labs Backpack
      Then I should be on the item detail page for Sauce Labs Backpack
      When I click the Add to cart button on the item detail page
      Then the cart icon should show 1 items

    @maximize
    @catalog
    Scenario: Add multiple items to cart
      Given I am on the homepage
      When I click the Add to cart for the item "backpack"
      And I click the Add to cart for the item "bike-light"
      Then the cart icon should show 2 items
