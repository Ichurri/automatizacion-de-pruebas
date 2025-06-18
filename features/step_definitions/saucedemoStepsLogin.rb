Given('I am on the login page') do
    visit('https://www.saucedemo.com/')
end

When('I enter {string} in the Username field') do |username|
    fill_in 'user-name', with: username
end

When('I enter {string} in the Password field') do |password|
    fill_in 'password', with: password
end

When('I click on the Login button') do
    click_button('login-button')
end

Then('I should be able to see the main page with the catalog of products') do
  expect(page).to have_selector(:css, "#header_container > div.header_secondary_container > span", text: "Products")
end