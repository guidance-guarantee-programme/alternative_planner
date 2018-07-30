require 'rails_helper'

RSpec.describe BookingRequest do
  it 'is valid with valid attributes' do
    expect(build(:booking_request)).to be_valid
  end
end
