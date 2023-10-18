class Location < ApplicationRecord
  has_many :booking_requests, dependent: :nullify

  validates :name, presence: true, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
end
