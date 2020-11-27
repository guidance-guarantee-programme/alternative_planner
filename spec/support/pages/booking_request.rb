module Pages
  class BookingRequest < SitePrism::Page
    set_url '/booking_requests/{id}'

    element :booking_type, '.t-booking-type'
    element :full_name, '.t-full-name'
    element :phone, '.t-phone'
    element :email, '.t-email'
    element :location_name, '.t-location'
    element :memorable_word, '.t-memorable-word'
    element :day_of_birth, '.t-date-of-birth-day'
    element :month_of_birth, '.t-date-of-birth-month'
    element :year_of_birth, '.t-date-of-birth-year'
    element :additional_info, '.t-additional-info'
    element :accessibility_needs, '.t-accessibility-needs'
    element :defined_contribution_pot_confirmed_yes, '.t-defined-contribution-pot-confirmed-yes'
    element :defined_contribution_pot_confirmed_dont_know, '.t-defined-contribution-pot-confirmed-dont-know'
    element :gdpr_consent, '.t-gdpr-consent'
    element :processed, '.t-processed'

    element :process, '.t-process'

    element :message, '.t-message'
    element :add_note, '.t-add-note'

    elements :notes, '.t-note'
  end
end
