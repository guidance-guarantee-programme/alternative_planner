FactoryBot.define do
  factory :booking_request do
    first_name { 'Daisy' }
    last_name { 'Smith' }
    email { 'daisy@example.com' }
    phone { '02082524729' }
    memorable_word { 'spacetravel' }
    date_of_birth { '1960-01-01' }
    defined_contribution_pot_confirmed { true }
    accessibility_needs { true }
    adjustments { 'These are the adjustments' }
    additional_info { '' }
    where_you_heard { 1 } # employer
    gdpr_consent { 'yes' }

    trait :face_to_face do
      location
    end
  end
end
