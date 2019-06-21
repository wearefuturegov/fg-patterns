class Service < ApplicationRecord
  validates :name, presence: true

  serialize :organisation_types, Array

  has_and_belongs_to_many :patterns, as: :service_patterns
  has_and_belongs_to_many :life_events

  def self.organisation_types
    [
      'County council',
      'District council',
      'Borough council',
      'City council',
      'Unitary authority',
      'London borough',
      'Metropolitan borough'
    ]
  end
end
