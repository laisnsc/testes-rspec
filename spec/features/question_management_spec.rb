require "rails_helper"

RSpec.feature 'Gerenciando questoes', type: :feature do
  before do
    allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
  end
  # let!(:admin){ FactoryBot.create :admin }
  let!(:question){ FactoryBot.create :question }

  scenario 'Visualizando questoes' do
    visit admins_backoffice_questions_path
    expect(page).to have_content question.description

  end

  scenario 'Criando questão', js: true do
    visit admins_backoffice_questions_path
    click_link(id: 'novo')
    sleep 1
    fill_in(id: 'question_description', with: 'new description')


    sleep 1
    click_button 'Salvar'
    expect(page).to have_content 'Cadastrada com sucesso!'
  end

  scenario 'Editando questoes', js: true do
    visit admins_backoffice_questions_path
    click_link(id: 'editar')
    sleep 1
    fill_in(id: 'question_description', with: 'edit description')
    sleep 1
    click_button 'Salvar'
    expect(page).to have_content 'Atualizada com sucesso!'
  end

  scenario 'Apagando uma questão', js: true do
    visit admins_backoffice_questions_path
    click_link(id: 'apagar')
    page.driver.browser.switch_to.alert.accept
    sleep 1
    # driver.switch_to.alert.accept
    sleep 1
    expect(page).to have_content 'Excluída com sucesso!'
    expect(page).to_not have_content :question
  end

end
