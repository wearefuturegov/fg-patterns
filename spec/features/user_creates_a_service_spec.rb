require "rails_helper"

RSpec.feature "Service creation", :type => :feature do

  scenario "User creates a new service" do
    visit new_service_path

    fill_in 'Name', with: 'Name of a new service'

    #page.find(:css, "service_patterns_1")
    click_button 'Create service'

    expect(page).to have_text('Thankyou!')
  end

end