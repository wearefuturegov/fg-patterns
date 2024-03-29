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
    expect(page).to_not have_text('1 sevice awaiting approval')

    page.driver.browser.authorize(ENV['HTTP_USERNAME'], ENV['HTTP_PASSWORD'])
    visit admin_services_path
    expect(page).to have_text('1 service awaiting approval')
    expect(page).to have_text(service.name)
    expect(page).to have_text(service.suggester_organisation)
    expect(page).to have_text(service.suggester_name)
    expect(page).to have_text(service.created_at.to_formatted_s(:short))
    first('table').click_link 'Moderate service'
    expect(page).to have_text("Edit #{service.name}")
    fill_in 'Name', with: 'Name of new service edited'

    click_button "Save but don't publish"
    expect(page).to have_text('1 service awaiting approval')
    first('table').click_link 'Moderate service'
    service.reload
    expect(service.status).to eq('awaiting_approval')
    expect(service.name).to eq('Name of new service edited')

    click_button 'Publish this service'
    service.reload
    expect(page).to have_text("Service #{service.name} was published")
    expect(page.find('.pattern_table')).to have_text(service.name)

    deliveries = ActionMailer::Base.deliveries
    email_count = deliveries.count
    deliveries[email_count-1].from.should include(ENV['ADMIN_EMAIL'])
    deliveries[email_count-1].to.should include(service.suggester_email)
  end
end