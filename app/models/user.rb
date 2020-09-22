class User < ApplicationRecord
  include GDS::SSO::User

  WELSH_PERMISSION = 'welsh'.freeze

  serialize :permissions, Array

  scope :enabled, -> { where(disabled: false) }
end
