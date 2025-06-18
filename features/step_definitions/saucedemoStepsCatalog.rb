Given('I am on the Products page') do
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
    expect(page).to have_content("A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.")
end
When('I click the Add to cart button on the item detail page') do
    click_button('add-to-cart')
end