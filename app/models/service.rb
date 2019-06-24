class Service < ApplicationRecord
  validates :name, :steps, :patterns, :organisation_types, presence: true
  validates :suggester_email, :suggester_organisation, presence: true, unless: :seed

  serialize :organisation_types, Array

  has_and_belongs_to_many :patterns, as: :service_patterns
  has_and_belongs_to_many :life_events

  attr_accessor :seed # Is set to true during seeding process so that suggester validations can be skipped.

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