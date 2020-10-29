class User < ApplicationRecord
  include GDS::SSO::User

  WELSH_PERMISSION = 'welsh'.freeze
  BSL_PERMISSION   = 'bsl'.freeze

  serialize :permissions, Array

  scope :enabled, -> { where(disabled: false) }

  def welsh?
    permissions.include?(WELSH_PERMISSION)
  end

  def bsl?
    permissions.include?(BSL_PERMISSION)
  end

  def self.welsh_guiders
    enabled.select(&:welsh?)
  end

  def self.bsl_guiders
    enabled.select(&:bsl?)
  end
end
