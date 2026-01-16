namespace :redact do
  desc 'Redact records older than 2 years'
  task gdpr: :environment do
    BookingRequest.redact_for_gdpr
    BslBookingRequest.redact_for_gdpr
  end
end
