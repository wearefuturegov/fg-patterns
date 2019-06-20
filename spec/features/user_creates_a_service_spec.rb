require "rails_helper"

RSpec.feature "Service creation", :type => :feature do

  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  scenario "User creates a new service" do
    visit new_service_path

    fill_in 'Name', with: 'Name of a new service'

    select 'County council', from: 'Organisation type'
    click_button 'Create service'

    expect(page).to have_text('Thankyou!')
    expect(Service.last.name).to eq('Name of a new service')
    expect(Service.last.organisation_type).to eq('County council')
  end

end