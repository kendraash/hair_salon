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
