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
              B. Book an appointment (by phone) > Pay (in person)"
    )
    expect(service).to be_valid
    expect(service.name).to eq('Register a birth')
    expect(service.sub_services).to eq("A. Book an appointment (online form) > Pay (in person)
              B. Book an appointment (by phone) > Pay (in person)")
  end

end