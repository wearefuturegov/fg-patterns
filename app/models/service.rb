class Service < ApplicationRecord
  validates :name, :steps, :pattern_ids, :organisation_types, presence: true
  validates :suggester_name, :suggester_email, :suggester_organisation, presence: true, unless: :seed
  validates :suggester_email, format: { with: URI::MailTo::EMAIL_REGEXP }, unless: :seed

  serialize :organisation_types, Array

  has_and_belongs_to_many :patterns, as: :service_patterns
  has_and_belongs_to_many :life_events

  before_create :set_status, unless: :seed

  scope :published, -> { where(status: 'published').order('LOWER(name)') }

  attr_accessor :seed # Is set to true during seeding process so that suggester validations can be skipped.

  def self.organisation_types
    [
      ['County council'],
      ['District council'],
      ['Borough council'],
      ['City council'],
      ['Unitary authority'],
      ['London borough'],
      ['Metropolitan borough']
    ]
  end

  private

  def set_status
    self.status = 'awaiting_approval'
  end

end