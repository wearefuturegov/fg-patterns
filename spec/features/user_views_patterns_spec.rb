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
    visit patterns_path(selected: pattern)
    service = pattern.services.first
    service_name_div = find('.table_data', text: service.name)
    service_row_div = service_name_div.first(:xpath,".//..") # parent element
    expect(service_row_div).to have_text(service.life_events.first.name)
  end

end