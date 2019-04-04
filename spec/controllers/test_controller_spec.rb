require "rails_helper"
class PostsTests < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers
  RSpec.describe Subject, type: :request do
    before do
      allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
    end

    context 'PUT #update' do
      let!(:subject) { FactoryBot.create :subject }

      it 'should update subject' do
        admin = FactoryBot.create(:admin)
        login_as(admin, scope: :admin)

        params = { description: 'new description' }
        put admins_backoffice_subject_path(subject), params: { id: subject.id, subject: params }
        subject.reload
        params.keys.each do |key|
        expect(subject.attributes[key.to_s]).to eq params[key]
        end
      end
    end
  end
end