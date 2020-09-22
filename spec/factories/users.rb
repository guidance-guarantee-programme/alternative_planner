FactoryBot.define do
  factory :user, aliases: [:guider] do
    uid { SecureRandom.uuid }
    name { 'Rick Sanchez' }
    email { 'rick@example.com' }
    permissions { %w[signin welsh] }

    trait :bsl do
      permissions { %w[signin bsl] }
    end
  end
end
