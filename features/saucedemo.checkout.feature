Feature: Checkout process
  As a Saucedemo user
  I want to checkout with my selected items
  So I can complete my purchase

  Background:
    Given I am on the login page
    And I enter "standard_user" in the Username field
    And I enter "secret_sauce" in the Password field
    And I click on the Login button
    And I click the Add to cart for the item "backpack"
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

  @checkout
  Scenario Outline: Checkout with missing required fields
    When I fill First Name with "<first_name>"
    And I Last Name with "<last_name>"
    And I Zip/Postal Code with "<zip_code>"
    And I click on the Continue button
    Then I should see an error message "<error_message>"

    Examples:
      | first_name | last_name | zip_code | error_message                  |
      |            | Perez     | 591      | Error: First Name is required  |
      | Juan       |           | 591      | Error: Last Name is required   |
      | Juan       | Perez     |          | Error: Postal Code is required |

  @checkout
  Scenario: Cancel checkout from information page
    When I click on the Cancel button
    Then I should be on the cart page

  @checkout
  Scenario: Cancel checkout from overview page
    When I fill First Name with "Juan"
    And I Last Name with "Perez"
    And I Zip/Postal Code with "591"
    And I click on the Continue button
    And I click on the Cancel button
    Then I should be able to see the Product page