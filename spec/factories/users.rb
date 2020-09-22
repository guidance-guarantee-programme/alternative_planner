FactoryBot.define do
  factory :user, aliases: [:guider] do
    uid { SecureRandom.uuid }
    name { 'Rick Sanchez' }
    email { 'rick@example.com' }
    permissions { %w[signin welsh] }
  end
end
