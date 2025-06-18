Feature: Footer link validation
  As a user of the SauceDemo site
  I want to be able to access social networks from the footer
  To ensure that the footer links work correctly

  Scenario: Validate footer link to Twitter
    Given I am on the SauceDemo homepage
    When I click on the footer link to "Twitter"
    Then a new tab should open with the Twitter page

  Scenario: Validate footer link to Facebook
    Given I am on the SauceDemo homepage
    When I click on the footer link to "Facebook"
    Then a new tab should open with the Facebook page

  Scenario: Validate footer link to LinkedIn
    Given I am on the SauceDemo homepage
    When I click on the footer link to "LinkedIn"
    Then a new tab should open with the LinkedIn page
