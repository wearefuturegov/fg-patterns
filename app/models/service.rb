class Service < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :patterns, as: :service_patterns
  has_and_belongs_to_many :life_events
end
