require "rails_helper"

class PostsTests < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers
  RSpec.describe Admin, type: :request do
    let!(:admin) { FactoryBot.create :admin }
    context 'GET #index' do
      it 'should success and render to index page' do
        sign_in FactoryBot.create :admin
        # get site_welcome_index_path
        get admins_backoffice_admins_path
        # status 200/ devise
        expect(response).to have_http_status(200)
        # expect(response).to render_template admins_backoffice_admins_path
      end
    end

    context 'POST #create' do
      it 'should create a new admin' do
        sign_in FactoryBot.create :admin
        get(edit_admins_backoffice_admin_path(admin))
        # expect {get(edit_admins_backoffice_admin_path(admin))}.to change(Admin, :count).by(1)
        # expect { click_button "Salvar" }.to change(Admin, :count).by(1)
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
