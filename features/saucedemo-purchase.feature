Feature: Saucedemo purchase item
   As a Saucedemo user
   I want to add an item to my cart and checkout
   so I can buy that product

   Background:
      Given I am on the login page
      When I enter "standard_user" in the Username field
      And I enter "secret_sauce" in the Password field
      And I click on the Login button

   @maximize
   Scenario: Add item to cart and checkout
      Given I am on the homepage
      When I click the first item on upper left
      And I click on the cart icon on upper right
      And I click the checkout button
      And I fill First Name with "Juan"
      And I Last Name with "Perez"
      And I Zip/Postal Code with "591"
      And I click on the Continue button
      And I click on the Finish Button
      Then I should see a message confirming my purchase