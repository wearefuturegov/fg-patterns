require 'rails_helper'

RSpec.describe LifeEvent, type: :model do

  before(:all) do
    Rails.application.load_seed
  end

  it 'is invalid without a name' do
    life_event = LifeEvent.new
    expect(life_event).to be_invalid
  end

  it 'saves basic details' do
    life_event = LifeEvent.create(
      name: "Having children"
    )
    expect(life_event).to be_valid
    expect(life_event.name).to eq('Having children')
  end

end
