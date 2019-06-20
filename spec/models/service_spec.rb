require 'rails_helper'

RSpec.describe Service, type: :model do

  before(:all) do
    Rails.application.load_seed
  end

  # it 'loads seed data' do
  #   expect(Pattern.count).to eq(7)
  # end

  it 'is invalid without a name' do
    service = Service.new
    expect(service).to be_invalid
  end

  it 'saves basic details' do
    service = Service.create(
      name: "Register a birth",
      sub_services: "A. Book an appointment (online form) > Pay (in person)
              B. Book an appointment (by phone) > Pay (in person)",
      life_events: [LifeEvent.first, LifeEvent.last],
      organisation_type: 'County council'
    )
    expect(service).to be_valid
    expect(service.name).to eq('Register a birth')
    expect(service.sub_services).to eq("A. Book an appointment (online form) > Pay (in person)
              B. Book an appointment (by phone) > Pay (in person)")
    expect(service.life_events).to eq([LifeEvent.first, LifeEvent.last])
    expect(service.organisation_type).to eq('County council')
  end

end
