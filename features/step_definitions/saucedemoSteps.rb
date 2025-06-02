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
Given('I am on the homepage') do
  expect(page).to have_selector(:css, "#header_container > div.header_secondary_container > span")
end

Then('the cart icon should show {int} items') do |count|
  expect(find(:css, '.shopping_cart_badge').text).to eq(count.to_s)
end

When('I click the Add to cart for the item {string}') do |item|
    button_to_click = 'add-to-cart-sauce-labs-' + item
    click_button(button_to_click)
end

When('I click the Remove button for the item {string}') do |item|
    button_id = 'remove-sauce-labs-' + item
    click_button(button_id)
end

Then('the cart icon should not be visible') do
    expect(page).to have_no_css('.shopping_cart_badge')
end

When('I click the item name Sauce Labs Backpack') do
    find(:css, '#item_0_title_link > div').click()
end

Then('I should be on the item detail page for Sauce Labs Backpack') do
    # expect(page).to have_css('.inventory_details_name', text: item_name)
    expect(page).to have_content("A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.")
end
When('I click the Add to cart button on the item detail page') do
    click_button('add-to-cart')
end




#Cart
When('I click on the cart icon on upper right') do
    find(:css, '#shopping_cart_container > a').click
end

When('I click the Continue Shopping button') do
  click_button('continue-shopping')
end

When('I click the Remove button for the item {string} on the cart page') do |item|
  button_id = 'remove-sauce-labs-' + item
  click_button(button_id)
end

Then('I should not see the selected item in the cart') do
  expect(page).to have_no_content('Sauce Labs Backpack')
end

Then('I should see the item {string} in the cart') do |item_name|
  expect(page).to have_content(item_name)
end

Then('I should see the selected item in the cart') do
  expect(page).to have_content('Sauce Labs Backpack')
end


# Checkout
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

Then('I should see an error message {string}') do |error_message|
  expect(page).to have_content(error_message)
end

When('I click on the Cancel button') do
  click_button('cancel')
end

Then('I should be on the cart page') do
  expect(page).to have_current_path('https://www.saucedemo.com/cart.html')
end