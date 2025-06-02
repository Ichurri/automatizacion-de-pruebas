Feature: Cart functionality
  As a Saucedemo user
  I want to view and manage my cart
  So I can proceed with the correct items

  Background:
    Given I am on the login page
    And I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button
    And I click the Add to cart for the item "backpack"

  @maximize
  @cart
  Scenario: View cart and proceed to checkout
    When I click on the cart icon on upper right
    Then I should see the selected item in the cart

  @maximize
  @cart
  Scenario: Remove item from cart on the cart page
    When I click on the cart icon on upper right
    And I click the Remove button for the item "backpack" on the cart page
    Then I should not see the selected item in the cart

  @cart
  @maximize
  Scenario: Add multiple items and view them in the cart
    When I click the Add to cart for the item "bike-light"
    And I click on the cart icon on upper right
    Then I should see the item "Sauce Labs Backpack" in the cart
    And I should see the item "Sauce Labs Bike Light" in the cart

  @maximize
  @cart
  Scenario: Continue shopping from the cart page
    When I click on the cart icon on upper right
    And I click the Continue Shopping button
    Then I should be able to see the Product page

