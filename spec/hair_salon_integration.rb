require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the stylist path', {:type => :feature}) do
  it('allows the user to see all stylists') do
    visit('/')
    click_on('View all Stylists')
    expect(page).to have_content('Stylists')
  end

  it('allow the user to add a new Stylist') do
    visit('/')
    click_on('View all Stylists')
    expect(page).to have_content('New Stylist:')
  end

  it('allow the user to click on a specific stylist and view all of their clients') do
  visit('/')
  click_on('View all Stylists')
  fill_in('new_stylist',  :with => 'Kendra')
  click_button('Add stylist')
  click_link('Kendra')
  expect(page).to have_content('Stylist: Kendra')
end
