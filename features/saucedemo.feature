Feature: Saucedemo login
   As a Saucedemo user
   I want to login into my account
   so I am able to shop from the Saucedemo webpage

@maximize
Scenario Outline: Login to Saucedemo as a normal user
	Given I am on the login page
	When I enter "<username>" in the Username field
	And I enter "<password>" in the Password field
	And I click on the Login button
	Then I should be able to see the Product page

Examples:
  | username                | password      | 
  | standard_user           | secret_sauce  |
  | problem_user            | secret_sauce  |
  | performance_glitch_user | secret_sauce  |
  | visual_user             | secret_sauce  |

