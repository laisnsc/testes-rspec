require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { FactoryBot.create :admin }
  subject { admin }
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  describe 'lowcase_email' do
        it 'must be lowcase' do
          expect(admin.email).to eq( admin.email.downcase )
        end
  end
end