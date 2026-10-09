class User < ApplicationRecord
  include GDS::SSO::User

  WELSH_PERMISSION = 'welsh'.freeze
  BSL_PERMISSION   = 'bsl'.freeze
  FACE_TO_FACE_PERMISSION = 'f2f'.freeze

  serialize :permissions, class: Array

  scope :enabled, -> { where(disabled: false) }

  def welsh?
    permissions&.include?(WELSH_PERMISSION)
  end

  def bsl?
    permissions&.include?(BSL_PERMISSION)
  end

  def face_to_face?
    permissions&.include?(FACE_TO_FACE_PERMISSION)
  end

  def self.welsh_guiders
    enabled.select(&:welsh?)
  end

  def self.bsl_guiders
    enabled.select(&:bsl?)
  end

  def self.face_to_face_guiders
    enabled.select(&:face_to_face?)
  end
end
