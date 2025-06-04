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
  expect(page).to have_selector(:css, "#header_container > div.header_secondary_container > span", text: "Products")
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



Then('I should see the item total is "${float}"') do |total|
  expect(find('.summary_subtotal_label')).to have_content("Item total: $#{'%.2f' % total}")
end

Then('I should see the tax amount') do
  expect(page).to have_css('.summary_tax_label')
end

Then('I should see the total price "${float}"') do |total|
  expect(page).to have_css('.summary_total_label')
end

Then('I should see the item {string} with price "{string}"') do |item_name, price|
  item = find('.cart_item', text: item_name)
  expect(item).to have_content(price)
end

Then('I should be on the confirmation page') do
  expect(page).to have_content('THANK YOU FOR YOUR ORDER')
end




Then('I should see the item {string} priced at {string}') do |item_name, expected_price|
  item = find('.cart_item', text: item_name)
  price = item.find('[data-test="inventory-item-price"]').text
  expect(price).to eq(expected_price)
end

Then('the item subtotal should be {string}') do |expected_subtotal|
  subtotal = find('[data-test="subtotal-label"]').text
  expect(subtotal).to include(expected_subtotal)
end

Then('the tax should be {string}') do |expected_tax|
  tax = find('[data-test="tax-label"]').text
  expect(tax).to include(expected_tax)
end

Then('the total should be {string}') do |expected_total|
  total = find('[data-test="total-label"]').text
  expect(total).to include(expected_total)
end


# Hamburger
And('I should see the hamburger menu available') do
  expect(page).to have_css('#react-burger-menu-btn')
end

When('I click on the hamburger menu button') do
  find('#react-burger-menu-btn').click
  sleep(0.5) # Pequeña pausa para que se abra el menú
end

When('I click on {string} option') do |option|
  case option
  when "All Items"
    find('#inventory_sidebar_link').click
  when "About"
    find('#about_sidebar_link').click
  when "Logout"
    find('#logout_sidebar_link').click
  when "Reset App State"
    find('#reset_sidebar_link').click
  end
end

# Step para verificar redirección a URL específica
Then('I should be redirected to {string}') do |expected_url|
  expect(page).to have_current_path(expected_url)
end

# Step para verificar información de Sauce Labs
And('I should see the Sauce Labs company information') do
  expect(page).to have_content('Power your mobile and web apps at scale')
end

And('I should not have access to protected pages') do
  visit('https://www.saucedemo.com/inventory.html')
  expect(page).to have_current_path('https://www.saucedemo.com/')
  expect(page).to have_css('#user-name')
end

And('I should see empty username and password fields') do
  expect(find('#user-name').value).to be_empty
  expect(find('#password').value).to be_empty
end

And('all filters should be reset to default') do
  expect(find('.product_sort_container').value).to eq('az')
end

And('the hamburger menu is displayed') do
  expect(page).to have_css('.bm-menu-wrap', visible: true)
end

And('I should see all available products in the inventory') do
  expect(page).to have_css('.inventory_item', count: 6)
end

And('I should remain on the current page') do
  expect(page).to have_current_path('https://www.saucedemo.com/inventory.html')
end

Then('I should see {string} option in the menu') do |option|
  case option
  when "All Items"
    expect(page).to have_css('#inventory_sidebar_link', text: 'All Items')
  when "About"
    expect(page).to have_css('#about_sidebar_link', text: 'About')
  when "Logout"
    expect(page).to have_css('#logout_sidebar_link', text: 'Logout')
  when "Reset App State"
    expect(page).to have_css('#reset_sidebar_link', text: 'Reset App State')
  end
end

# Step para verificar que las opciones del menú son clickeables
And('the {string} option should be clickable') do |option|
  case option
  when "All Items"
    expect(page).to have_link('All Items')
  when "About"
    expect(page).to have_link('About')
  when "Logout"
    expect(page).to have_link('Logout')
  when "Reset App State"
    expect(page).to have_link('Reset App State')
  end
end

And('all menu options should be clickable') do
  expect(page).to have_link('All Items')
  expect(page).to have_link('About')
  expect(page).to have_link('Logout')
  expect(page).to have_link('Reset App State')
end

Then('I should be redirected to the login page') do
  expect(page).to have_current_path('https://www.saucedemo.com/')
  expect(page).to have_css('#user-name')
  expect(page).to have_css('#password')
end