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
