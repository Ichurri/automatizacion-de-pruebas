Feature: Checkout process
  As a Saucedemo user
  I want to checkout with my selected items
  So I can complete my purchase

  Background:
    Given I am on the login page
    And I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button
    And I click the first item on upper left
    And I click on the cart icon on upper right
    And I click the checkout button

  @checkout
  Scenario: Successful checkout with valid data
    When I fill First Name with "Juan"
    And I Last Name with "Perez"
    And I Zip/Postal Code with "591"
    And I click on the Continue button
    And I click on the Finish Button
    Then I should see a message confirming my purchase
