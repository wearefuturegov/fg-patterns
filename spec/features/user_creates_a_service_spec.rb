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

    org_type_checkbox = within('.service_organisation_types') { find("input[type='checkbox']", match: :first) }
    org_type_checkbox.set(:true)

    fill_in 'Steps', with: "Here are the steps required"

    fill_in 'Your email', with: 'example@example.com'
    fill_in 'Your organisation', with: 'ECC'

    pattern_checkbox = within('.service_patterns') { find("input[type='checkbox']", match: :first) }
    pattern_checkbox.set(:true)

    life_event_checkbox = within('.service_life_event_ids') { find("input[type='checkbox']", match: :first) }
    life_event_checkbox.set(:true)

    select 'Yes', from: 'Transactional'

    click_button 'Create service'

    expect(page).to have_text('Thankyou!')

    service = Service.last
    expect(service.name).to eq('Name of a new service')
    expect(service.organisation_types).to eq(['County council'])
    expect(service.steps).to eq('Here are the steps required')
    expect(service.suggester_email).to eq('example@example.com')
    expect(service.suggester_organisation).to eq('ECC')
    expect(service.patterns.first).to eq(Pattern.first)
    expect(service.transactional).to eq(true)

    visit patterns_path(selected: service.patterns.first.id)
    expect(page).to_not have_text(service.name)
  end

end