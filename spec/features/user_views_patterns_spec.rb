require "rails_helper"

RSpec.feature "Patterns viewing", :type => :feature do

  before(:all) do
    Rails.application.load_seed
  end

  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  scenario "User views patterns" do
    pattern = Pattern.first
    visit filter_by_pattern_path(pattern.slug)
    service = pattern.services.first
    service_name_div = find('.table__data', text: service.name)
    service_row_div = service_name_div.first(:xpath,".//..") # parent element
    expect(service_row_div).to have_text(service.life_events.first.name)
    expect(service_row_div).to have_text(service.organisation_types.first)
  end

  # scenario "User filters by life event", js: true do
  #   life_event = LifeEvent.first
  #   visit services_path
  #   select "Moving somewhere", from: "life_event_select"
  #   page.all(:css, '.data_row').each do |data_row|
  #     expect(data_row).to have_text(life_event.name)
  #   end
  # end

end