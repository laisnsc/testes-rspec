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
end
