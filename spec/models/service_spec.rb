require 'rails_helper'

RSpec.describe Service, type: :model do

  before(:all) do
    Rails.application.load_seed
  end

  it 'is invalid without a name' do
    attrs = FactoryBot.attributes_for(:service).except(:name)
    expect(Service.new(attrs)).to be_invalid
  end

  it 'is invalid without steps' do
    attrs = FactoryBot.attributes_for(:service).except(:steps)
    expect(Service.new(attrs)).to be_invalid
  end

  it 'is invalid without patterns' do
    attrs = FactoryBot.attributes_for(:service).except(:patterns)
    expect(Service.new(attrs)).to be_invalid
  end

  it 'is valid without life events' do
    attrs = FactoryBot.attributes_for(:service).except(:life_events)
    expect(Service.new(attrs)).to be_valid
  end

  it 'is invalid without organisation type' do
    attrs = FactoryBot.attributes_for(:service).except(:organisation_types)
    expect(Service.new(attrs)).to be_invalid
  end

  it 'is invalid without suggester email' do
    attrs = FactoryBot.attributes_for(:service).except(:suggester_email)
    expect(Service.new(attrs)).to be_invalid
  end

  it 'is invalid without suggester organisation' do
    attrs = FactoryBot.attributes_for(:service).except(:suggester_organisation)
    expect(Service.new(attrs)).to be_invalid
  end

  it 'is valid with all fields' do
    attrs = FactoryBot.attributes_for(:service)
    expect(Service.new(attrs)).to be_valid
  end

end
