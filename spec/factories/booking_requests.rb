FactoryBot.define do
  factory :booking_request do
    first_name 'Daisy'
    last_name 'Smith'
    email 'daisy@example.com'
    phone '02082524729'
    memorable_word 'spacetravel'
    date_of_birth '1960-01-01'
    defined_contribution_pot_confirmed true
    accessibility_needs false
    additional_info ''
    where_you_heard 1 # An employer
    gdpr_consent 'yes'
  end
end
