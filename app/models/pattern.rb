class Pattern < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_and_belongs_to_many :services, as: :service_patterns
  has_many :life_events, through: :services
end
