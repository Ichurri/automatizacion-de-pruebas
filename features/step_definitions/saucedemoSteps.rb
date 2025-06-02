# Login
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

Then('I should be able to see the Product page') do
  expect(page).to have_selector(:css, "#header_container > div.header_secondary_container > span")
end

#Catalog
Then('the cart icon should show {int} item') do |count|
  expect(find(:css, '.shopping_cart_badge').text).to eq(count.to_s)
end

#Cart
Then('I should see the selected item in the cart') do
  expect(page).to have_content('Sauce Labs Backpack')
end




# Purchase
Given('I am on the homepage') do
  expect(page).to have_selector(:css, "#header_container > div.header_secondary_container > span")
end

When('I click the first item on upper left') do
    click_button('add-to-cart-sauce-labs-backpack')
end

When('I click on the cart icon on upper right') do
    find(:css, '#shopping_cart_container > a').click
end

When('I click the checkout button') do
    click_button('checkout')
end

When('I fill First Name with {string}') do |first_name|
    fill_in 'first-name', with: first_name
end

When('I Last Name with {string}') do |last_name|
    fill_in 'last-name', with: last_name
end

When('I Zip\/Postal Code with {string}') do |postal_code|
    fill_in 'postal-code', with: postal_code
end

When('I click on the Continue button') do
    click_button('continue')
end

When('I click on the Finish Button') do
    click_button('finish')
end

Then('I should see a message confirming my purchase') do
    expect(page).to have_content('Your order has been dispatched, and will arrive just as fast as the pony can get there!')
end