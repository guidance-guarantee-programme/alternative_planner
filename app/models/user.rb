class User < ApplicationRecord
  include GDS::SSO::User

  WELSH_PERMISSION = 'welsh'.freeze

  serialize :permissions, Array

  scope :enabled, -> { where(disabled: false) }

  def welsh?
    permissions.include?(WELSH_PERMISSION)
  end

  def self.welsh_guiders
    enabled.select(&:welsh?)
  end
end
