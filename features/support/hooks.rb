After do
    Capybara.current_session.driver.quit
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

Before('@clear_cart') do
  while page.has_button?(/^Remove/)
    all('button', text: /^Remove/).each(&:click)
  end
end



