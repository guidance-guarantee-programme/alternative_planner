require 'rails_helper'
require 'gds-sso/lint/user_spec'

RSpec.describe User, type: :model do
  it_behaves_like 'a gds-sso user class'

  it 'is valid with valid attributes' do
    expect(build(:user)).to be_valid
  end

  context 'when the permissions are nil' do
    subject { build(:user, permissions: nil) }

    it 'responds correctly for `#welsh?`' do
      expect(subject).to_not be_welsh
    end

    it 'responds correctly for `#bsl?`' do
      expect(subject).to_not be_bsl
    end

    it 'responds correctly for `#face_to_face?`' do
      expect(subject).to_not be_face_to_face
    end
  end

  context 'when the permissions are assigned' do
    it 'responds correctly for `#welsh?`' do
      expect(build(:guider)).to be_welsh
    end

    it 'responds correctly for `#bsl?`' do
      expect(build(:bsl_guider)).to be_bsl
    end

    it 'responds correctly for `#face_to_face?`' do
      expect(build(:face_to_face_guider)).to be_face_to_face
    end
  end
end
