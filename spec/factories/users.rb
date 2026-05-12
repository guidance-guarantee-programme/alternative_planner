FactoryBot.define do
  factory :user, aliases: [:guider] do
    uid { SecureRandom.uuid }
    name { 'Rick Sanchez' }
    email { 'rick@example.com' }
    permissions { %w[signin welsh] }

    factory :bsl_guider do
      permissions { %w[signin bsl] }
    end

    factory :face_to_face_guider do
      permissions { %w[signin f2f] }
    end
  end
end
