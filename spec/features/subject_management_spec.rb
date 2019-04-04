require "rails_helper"

RSpec.feature 'Gerenciando assuntos/areas', type: :feature do
  before do
    allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
  end
  # let!(:admin){ FactoryBot.create :admin }
  let!(:subject){ FactoryBot.create :subject }

  scenario 'Visualizando assuntos/areas' do
    visit admins_backoffice_subjects_path
    expect(page).to have_content subject.description

  end

  scenario 'Criando assunto/area', js: true do
    visit admins_backoffice_subjects_path
    click_link(id: 'novo')
    sleep 1
    fill_in(id: 'subject_description', with: 'new subject')


    sleep 1
    click_button 'Salvar'
    expect(page).to have_content 'Cadastrado com sucesso'
  end

  scenario 'Editando assuntos/areas', js: true do
    visit admins_backoffice_subjects_path
    click_link(id: 'editar')
    sleep 1
    fill_in(id: 'subject_description', with: 'edit subject')
    sleep 1
    click_button 'Salvar'
    expect(page).to have_content 'Atualizado com sucesso!'
  end

  scenario 'Apagando assunto/area', js: true do
    visit admins_backoffice_subjects_path
    click_link(id: 'apagar')
    page.driver.browser.switch_to.alert.accept
    sleep 1
    # driver.switch_to.alert.accept
    sleep 1
    expect(page).to have_content 'Excluido com sucesso!'
    expect(page).to_not have_content :subject
  end

end
