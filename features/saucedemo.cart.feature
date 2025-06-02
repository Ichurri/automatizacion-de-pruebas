Feature: Cart functionality
  As a Saucedemo user
  I want to view and manage my cart
  So I can proceed with correct items

  Background:
    Given I am on the login page
    And I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button
    And I click the Add to cart for the item "backpack"

  @cart
  Scenario: View cart and proceed to checkout
    When I click on the cart icon on upper right
    Then I should see the selected item in the cart
