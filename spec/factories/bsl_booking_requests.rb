FactoryBot.define do
  factory :bsl_booking_request do
    first_name { 'George' }
    last_name { 'Smith' }
    email { 'george@example.com' }
    phone { '02082524728' }
    memorable_word { 'space' }
    date_of_birth { '1965-01-01' }
    defined_contribution_pot_confirmed { true }
    accessibility_needs { false }
    additional_info { '' }
    where_you_heard { 1 } # employer
    gdpr_consent { 'no' }

    trait :nominated_support do
      support { 'yes' }
      support_name { 'Bob Michael' }
      support_relationship { 'Wife' }
      support_phone { '0208 252 4729' }
      support_email { 'bob@example.com' }
    end
  end
end
