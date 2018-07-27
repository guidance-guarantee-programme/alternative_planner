require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:location)).to be_valid
  end
end
