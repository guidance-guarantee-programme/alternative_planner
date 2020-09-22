require 'rails_helper'

RSpec.describe BslBookingRequest do
  it 'is valid with valid attributes' do
    expect(build(:bsl_booking_request)).to be_valid
  end
end
