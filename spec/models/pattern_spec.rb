require 'rails_helper'

RSpec.describe Pattern, type: :model do

  before(:all) do
    Rails.application.load_seed
  end

  it 'loads seed data' do
    expect(Pattern.count).to eq(2)
  end

  it 'is invalid without a name' do
    pattern = Pattern.new
    expect(pattern).to be_invalid
  end

  it 'is invalid without a description' do
    pattern = Pattern.new(name: 'Pattern 1')
    expect(pattern).to be_invalid
  end

  it 'saves basic details' do
    pattern = Pattern.create(
      name: "Check something",
      description: "Lorem ipsum dolor amet fanny pack cray vice, single-origin coffee vape"
    )
    expect(pattern).to be_valid
    expect(pattern.name).to eq('Check something')
    expect(pattern.description).to eq('Lorem ipsum dolor amet fanny pack cray vice, single-origin coffee vape')
  end

end
