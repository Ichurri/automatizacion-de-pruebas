And('I should see the lateral menu available') do
  expect(page).to have_selector('#react-burger-menu-btn', visible: true), "Expected lateral menu button to be visible"
end


When('I click on the lateral menu button') do
  button = find('#react-burger-menu-btn', visible: true)
  button.click
  expect(page).to have_selector('.bm-menu-wrap', visible: true, wait: 2), "Expected lateral menu to be visible after click"
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
  expect(page).to have_current_path(expected_url, url: true), "Expected to be at #{expected_url}, but was at #{page.current_url}"
end


And('I should see the Sauce Labs company information') do
  page_message = find('#__next > div.MuiBox-root.css-107rrsf > div > div > div.MuiStack-root.css-63esow > div > div.MuiStack-root.css-ubwyx9 > div.MuiBox-root.css-0 > div.MuiBox-root.css-zm2eng > div > p', visible: true)
  expect(page_message).to have_text(/Power your mobile and web apps at scale/i), "Expected Sauce Labs info main page, got: #{page_message.text}"
end


And('I should not have access to protected pages like:') do |table|
  base_url = 'https://www.saucedemo.com'

  table.raw[1..].flatten.each do |path|
    visit("#{base_url}#{path}")
    expect(page).to have_current_path("#{base_url}/")
    expect(page).to have_css('#user-name')  
  end
end

And('I should see empty username and password fields') do
  username = find('#user-name', visible: true)
  password = find('#password', visible: true)
  expect(username[:value]).to eq(''), "Expected empty username, got '#{username[:value]}'"
  expect(password[:value]).to eq(''), "Expected empty password, got '#{password[:value]}'"
end


And('all filters should be reset to default') do
  dropdown = find('.product_sort_container', visible: true)
  expect(dropdown.value).to eq('az'), "Expected default filter to be 'az', got '#{dropdown.value}'"
end


And('the lateral menu is displayed') do
  menu = find('.bm-menu-wrap', visible: true)
  expect(menu).to have_css('.bm-item-list'), "Expected lateral menu to contain items"
  expect(menu.text).to include('All Items'), "Expected 'All Items' option in menu, got: #{menu.text}"
end


And('I should see all available products in the inventory') do
  products = all('.inventory_item', wait: 5)
  expect(products.size).to eq(6), "Expected 6 products, found #{products.size}"
end


And('I should remain on the current page') do
  expect(page).to have_current_path(/inventory\.html$/, wait: 5)
  expect(page).to have_css('.inventory_list', visible: true), "Expected inventory list to be visible"
  expect(all('.inventory_item').size).to be > 0, "Expected at least one product on the page"
end


Then('I should see {string} option in the menu') do |option|
  selector = case option
             when 'All Items' then '#inventory_sidebar_link'
             when 'About' then '#about_sidebar_link'
             when 'Logout' then '#logout_sidebar_link'
             when 'Reset App State' then '#reset_sidebar_link'
             else raise "Unknown option: #{option}"
             end
  element = find(selector, visible: true)
  expect(element.text).to eq(option), "Expected menu option text '#{option}', got '#{element.text}'"
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

And('I should see the following fields empty:') do |table|
  table.hashes.each do |row|
    field = row['field']
    value = row['value'] || ''

    selector = case field
    when 'Username'
      '#user-name'
    when 'Password'
      '#password'
    else
      raise "Unknown field: #{field}"
    end

    expect(find(selector).value).to eq(value)
  end
end

Then('I should see the following options in the menu:') do |table|
  table.raw[1..].flatten.each do |option|
    case option
    when 'All Items'
      expect(page).to have_css('#inventory_sidebar_link', text: option)
    when 'About'
      expect(page).to have_css('#about_sidebar_link', text: option)
    when 'Logout'
      expect(page).to have_css('#logout_sidebar_link', text: option)
    when 'Reset App State'
      expect(page).to have_css('#reset_sidebar_link', text: option)
    else
      raise "Unknown menu option: #{option}"
    end
  end
end
