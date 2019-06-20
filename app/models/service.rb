class Service < ApplicationRecord
  validates :name, presence: true

  has_and_belongs_to_many :patterns, as: :service_patterns
  has_and_belongs_to_many :life_events

  def self.organisation_type_dropdown
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
