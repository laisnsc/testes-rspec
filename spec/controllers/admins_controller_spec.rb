require "rails_helper"
# class PostsControllerTest < ActionController::TestCase
#   include Devise::Test::IntegrationHelpers
# end
# RSpec.describe ControllerAdmins, :type => :controller do
#   describe "GET index" do
#     it "renders index" do
#       admin = Factory(:admin)
#       get :index
#       response.should render_template :index
#     end
#   end
# end


##################################    exemplo rspec.pdf
# # RSpec.describe Admin, type: :controller do
# describe 'POST #create' do
#   let(:admin) { FactoryBot.create :admin }
#   context 'when password is invalid' do
#     it 'renders the page with error' do
#       post :create, params: { email: admin.email, password: 'invalid' }
#       expect(response).to render_template(:new)
#       # expect(flash[:notice]).to eq(Email and password do not match)
#       # end
#     end
#     context 'when password is valid' do
#       it 'sets the admin in the session and redirects them to their dashboard' do
#         post :create, params: { email: admin.email, password: admin.password }
#         expect(response).to redirect_to '/dashboard'
#         # expect(controller.current_admin).to eq admin
#       end
#     end
#   end
# end
#
#
###################################    fim exemplo rspec.pdf
#####################     testes erro webmock
############### fim erros webmock
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