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
  confirmation = find('.complete-text', wait: 5)
  expect(confirmation).to be_visible
  expect(confirmation.text).to include('Your order has been dispatched'), "Expected confirmation message, got: #{confirmation.text}"
end


Then('I should see an error message {string}') do |error_message|
  error = find('[data-test="error"]', visible: true)
  expect(error.text).to eq(error_message), "Expected error '#{error_message}', got: '#{error.text}'"
end


When('I click on the Cancel button') do
  click_button('cancel')
end

Then('I should be on the cart page') do
  expect(page).to have_current_path('https://www.saucedemo.com/cart.html')
end

Then('I should see the item total is {string} dollars') do |expected_total|
  subtotal_text = find('.summary_subtotal_label').text
  actual_total = subtotal_text[/\d+\.\d+/].to_f
  expect(format('%.2f', actual_total)).to eq(expected_total)
end

Then('I should see the item {string} with price "{string}"') do |item_name, price|
  item = find('.cart_item', text: item_name, match: :first)
  actual_price = item.find('.inventory_item_price').text
  expect(actual_price).to eq(price), "Expected item price '#{price}', got '#{actual_price}'"
end


Then('I should be on the confirmation page') do
  expect(page).to have_content('THANK YOU FOR YOUR ORDER')
end

Then('I should see the item {string} priced at {string}') do |item_name, expected_price|
  item = find('.cart_item', text: item_name)
  price = item.find('[data-test="inventory-item-price"]').text
  expect(price).to eq(expected_price)
end

Then('the item subtotal should be {string} dollars') do |expected_subtotal|
  subtotal = find('[data-test="subtotal-label"]').text
  actual_value = subtotal[/\d+\.\d+/].to_f
  expect(format('%.2f', actual_value)).to eq(expected_subtotal)
end
Then('the tax should be {string} dollars') do |expected_tax|
  subtotal_text = find('[data-test="subtotal-label"]').text
  tax_text = find('[data-test="tax-label"]').text

  subtotal = subtotal_text[/\d+\.\d+/].to_f
  tax_displayed = tax_text[/\d+\.\d+/].to_f
  tax_expected = expected_tax[/\d+\.\d+/].to_f

  # Find the varialbe in the ENV file or set to 0.08 as fallback
  tax_rate = ENV.fetch('TAX_RATE', '0.08').to_f
  calculated_tax = (subtotal * tax_rate).round(2)

  # Verify UI with calculated value
  expect(tax_displayed).to eq(calculated_tax), "Expected tax based on subtotal #{subtotal} to be #{calculated_tax}, but got #{tax_displayed}"

  # Verify UI with input value
  expect(tax_displayed).to eq(tax_expected), "Expected tax from feature to be #{tax_expected}, but got #{tax_displayed}"
end


Then('the total price should match the sum of subtotal and tax') do
  subtotal = find('[data-test="subtotal-label"]').text[/\d+\.\d+/].to_f
  tax = find('[data-test="tax-label"]').text[/\d+\.\d+/].to_f
  total = find('[data-test="total-label"]').text[/\d+\.\d+/].to_f

  expected_total = (subtotal + tax).round(2)
  expect(total).to eq(expected_total)
end
