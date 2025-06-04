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
