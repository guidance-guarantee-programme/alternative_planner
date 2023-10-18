require 'rails_helper'

RSpec.describe 'GET /api/v1/locations.json' do
  it 'returns a serialized list of locations' do
    create(:location, name: 'A Location')
    create(:location, name: 'Z Location')

    get api_v1_locations_path, as: :json

    expect(response).to be_successful

    expect(JSON.parse(response.body)).to contain_exactly(
      {
        'id' => an_instance_of(Integer),
        'name' => 'A Location'
      },
      {
        'id' => an_instance_of(Integer),
        'name' => 'Z Location'
      }
    )
  end
end
