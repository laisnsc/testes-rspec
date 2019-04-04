require "rails_helper"

class PostsTests < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  RSpec.describe Question, type: :request do
    before do
      allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
    end

    let!(:question) { FactoryBot.create :question }

    describe 'GET #index' do
      it 'should success and render to index page' do
        get admins_backoffice_questions_path
        expect(response).to have_http_status(200)
      end
    end

    describe 'POST #create' do
      context 'valid question description' do
        it 'should create a new question' do
          visit new_admins_backoffice_question_path
          fill_in id: "question_description", with: "new description"
          expect { click_button "Salvar" }.to change(Question, :count).by(1)
        end
      end

      context 'invalid question description' do
        it 'should show error' do
          visit new_admins_backoffice_question_path
          fill_in id: "question_description", with: "x"*141
          click_button "Salvar"
          expect(page).to have_content "Descrição é muito longo (máximo: 140 caracteres)"
        end
      end
    end

    describe 'PUT #update' do
      it "should update an existing question" do
        params = { description: 'new description' }
        put admins_backoffice_question_path(question), params: { id: question.id, question: params }
        question.reload
        params.keys.each do |key|
          expect(question.attributes[key.to_s]).to eq params[key]
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'should delete question' do
        expect { delete admins_backoffice_question_path(question), params: { id: question.id } }.to change(Question, :count).by(-1)
        expect(flash[:notice]).to eq 'Excluída com sucesso!'
      end
    end
  end

  RSpec.describe Question, type: :routing do
    describe 'routing' do
      it 'routes to #index' do
        expect(get: 'admins_backoffice/questions').to route_to('admins_backoffice/questions#index')
      end

      it 'routes to #show' do
        expect(get: 'admins_backoffice/questions/1').to route_to('admins_backoffice/questions#show', id: '1')
      end

      it 'routes to #new' do
        expect(get: 'admins_backoffice/questions/new').to route_to('admins_backoffice/questions#new')
      end

      it 'routes to #update via PUT' do
        expect(put: 'admins_backoffice/questions/1').to route_to('admins_backoffice/questions#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: 'admins_backoffice/questions/1').to route_to('admins_backoffice/questions#update', id: '1')
      end
    end
  end
end
