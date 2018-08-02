class User < ApplicationRecord
  include GDS::SSO::User

  serialize :permissions, Array

  scope :enabled, -> { where(disabled: false) }
end
