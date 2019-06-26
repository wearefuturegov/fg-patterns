require "rails_helper"

RSpec.feature "Service moderation", :type => :feature do

  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  scenario "Admin approves a new service" do
    service = Service.create(FactoryBot.attributes_for(:service))

    visit admin_services_path
    expect(page).to_not have_text('Sevices awaiting approval')

    page.driver.browser.authorize(ENV['HTTP_USERNAME'], ENV['HTTP_PASSWORD'])
    visit admin_services_path
    expect(page).to have_text('Services awaiting approval')
    expect(page).to have_text(service.name)
    expect(page).to have_text(service.suggester_organisation)
    expect(page).to have_text(service.suggester_name)
    expect(page).to have_text(service.created_at)

    click_link 'Moderate service'
    expect(page).to have_text("Edit #{service.name}")
    fill_in 'Name', with: 'Name of new service edited'

    click_button 'Publish this service'
    service.reload
    expect(page).to have_text("Service #{service.name} was published")
    expect(page.find('.pattern_table')).to have_text(service.name)
  end
end