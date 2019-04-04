require "rails_helper"

class PostsTests < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  RSpec.describe Subject, type: :request do
    before do
      allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
    end

    let!(:subject) { FactoryBot.create :subject }

    describe 'GET #index' do
      it 'should success and render to index page' do
        sign_in FactoryBot.create :admin
        # FactoryBot.create :subject
        # get site_welcome_index_path
        get admins_backoffice_subjects_path
        # status 200/ devise
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      context 'valid subject description' do
        it 'should create a new subject' do
          sign_in FactoryBot.create :admin
          # subject = FactoryBot.create(:subject)
          # login_as(subject, scope: :subject)
          visit new_admins_backoffice_subject_path
          fill_in id: "subject_description", with: "new description"
          expect { click_button "Salvar" }.to change(Subject, :count).by(1)
        end
      end

      context 'invalid subject description' do
        it 'should show error' do
          sign_in FactoryBot.create :admin
          # subject = FactoryBot.create(:subject)
          # login_as(subject, scope: :subject)
          visit new_admins_backoffice_subject_path
          fill_in id: "subject_description", with: "x"*141
          click_button "Salvar"
          expect(page).to have_content "Descrição é muito longo (máximo: 140 caracteres)"
        end
      end
    end

    describe 'PUT #update' do
      context 'valid update' do
        # let!(:subject) { FactoryBot.create :subject }
        it 'should update subject' do
          sign_in FactoryBot.create :admin
          # admin = FactoryBot.create(:admin)
          # login_as(admin, scope: :admin)
          params = { description: 'new description' }
          put admins_backoffice_subject_path(subject), params: { id: subject.id, subject: params }
          subject.reload
          params.keys.each do |key|
            expect(subject.attributes[key.to_s]).to eq params[key]
          end
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete subject' do
        subject = FactoryBot.create(:subject)
        login_as(subject, scope: :subject)
        expect { delete admins_backoffice_subject_path(subject), params: { id: subject.id } }.to change(Subject, :count).by(-1)
        expect(flash[:notice]).to eq 'Excluido com sucesso!'
      end
    end
  end

  RSpec.describe Subject, type: :routing do
    describe 'routing' do
      it 'routes to #index' do
        expect(get: 'admins_backoffice/subjects').to route_to('admins_backoffice/subjects#index')
      end

      it 'routes to #show' do
        expect(get: 'admins_backoffice/subjects/1').to route_to('admins_backoffice/subjects#show', id: '1')
      end

      it 'routes to #new' do
        expect(get: 'admins_backoffice/subjects/new').to route_to('admins_backoffice/subjects#new')
      end

      it 'routes to #update via PUT' do
        expect(put: 'admins_backoffice/subjects/1').to route_to('admins_backoffice/subjects#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: 'admins_backoffice/subjects/1').to route_to('admins_backoffice/subjects#update', id: '1')
      end
    end
  end
end
