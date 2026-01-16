class BookingRequest < ApplicationRecord
  belongs_to :location, optional: true
  has_many :notes, as: :notable, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true
  validates :phone, presence: true
  validates :memorable_word, presence: true
  validates :accessibility_needs, inclusion: { in: [true, false] }
  validates :defined_contribution_pot_confirmed, inclusion: { in: [true, false] }
  validates :additional_info, length: { maximum: 320 }, allow_blank: true
  validates :where_you_heard, presence: true
  validates :gdpr_consent, inclusion: { in: ['yes', 'no', ''] }

  def face_to_face?
    location_id.present?
  end

  def process!
    touch(:processed_at) unless processed_at? # rubocop:disable Rails/SkipsModelValidations
  end

  def booking_type
    'Welsh Language'
  end

  def self.redact_for_gdpr
    where('created_at < ?', 2.years.ago).update_all( # rubocop:disable Rails/SkipsModelValidations
      first_name: 'redacted',
      last_name: 'redacted',
      email: 'redacted@example.com',
      phone: 'redacted',
      memorable_word: 'redacted',
      additional_info: 'redacted'
    )
  end
end
