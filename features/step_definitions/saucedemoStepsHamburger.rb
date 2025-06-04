And('I should see the hamburger menu available') do
  expect(page).to have_css('#react-burger-menu-btn')
end

When('I click on the hamburger menu button') do
  find('#react-burger-menu-btn').click
  sleep(0.5)
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

Then('I should be redirected to {string}') do |expected_url|
  expect(page).to have_current_path(expected_url)
end

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