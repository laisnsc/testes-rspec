require "rails_helper"

class PostsTests < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  RSpec.describe Admin, type: :request do
    before do
      allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
    end

    let!(:admin) { FactoryBot.create :admin }

    context 'GET #index' do
      it 'should success and render to index page' do
        # sign_in FactoryBot.create :admin
        get admins_backoffice_admins_path
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      context 'valid password' do
        it 'should create a new admin' do
          # admin = FactoryBot.create(:admin)
          # login_as(admin, scope: :admin)
          visit new_admins_backoffice_admin_path
          fill_in id: "admin_email", with: "teste@id.uff.br"
          fill_in id: "admin_password", with: "111111"
          fill_in id: "admin_password_confirmation", with: "111111"
          expect { click_button "Salvar" }.to change(Admin, :count).by(1)
        end
      end

      context 'invalid password' do
        it 'should show error' do
          # admin = FactoryBot.create(:admin)
          # login_as(admin, scope: :admin)
          visit new_admins_backoffice_admin_path
          fill_in id: "admin_email", with: "teste@id.uff.br"
          fill_in id: "admin_password", with: "1111"
          fill_in id: "admin_password_confirmation", with: "1111"
          click_button "Salvar"
          expect(page).to have_content "Senha é muito curto (mínimo: 6 caracteres)"
        end
      end
    end

    describe 'PUT #update' do
      it "should update an existing admin" do
        put admins_backoffice_admin_path(admin), params: {admin:{ email: 'update@id.uff.br', password: admin.password, password_confirmation: admin.password }}
        admin.reload
          expect(admin.email).to eq 'update@id.uff.br'
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete admin' do
        expect { delete admins_backoffice_admin_path(admin), params: { id: admin.id } }.to change(Admin, :count).by(-1)
        expect(flash[:notice]).to eq 'Administrador excluido com sucesso!'
      end
    end
  end

  RSpec.describe Admin, type: :routing do
    describe 'routing' do
      it 'routes to #index' do
        expect(get: 'admins_backoffice/admins').to route_to('admins_backoffice/admins#index')
      end

      it 'routes to #show' do
        expect(get: 'admins_backoffice/admins/1').to route_to('admins_backoffice/admins#show', id: '1')
      end

      it 'routes to #new' do
        expect(get: 'admins_backoffice/admins/new').to route_to('admins_backoffice/admins#new')
      end

      it 'routes to #update via PUT' do
        expect(put: 'admins_backoffice/admins/1').to route_to('admins_backoffice/admins#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: 'admins_backoffice/admins/1').to route_to('admins_backoffice/admins#update', id: '1')
      end
    end
  end
end

