require "rails_helper"

RSpec.feature 'Gerenciando admins', type: :feature do
  before do
    allow_any_instance_of(AdminsBackofficeController).to receive(:authenticate_admin!).and_return(true)
  end
  let!(:admin){ FactoryBot.create :admin }

  scenario 'Visualizando admins' do
    visit admins_backoffice_admins_path
    expect(page).to have_content admin.email

  end

  scenario 'Criando um admin', js: true do
    visit admins_backoffice_admins_path
    click_link(id: 'novo')
    sleep 1
    fill_in('Email', with: 'new@id.uff.br')
    fill_in(id: 'admin_password', with: '000000')
    fill_in(id: 'admin_password_confirmation', with: '000000')
    sleep 1
    click_button 'Salvar'
    expect(page).to have_content 'Administrador cadastrado com sucesso'
  end

  scenario 'Editando um admin', js: true do
    visit admins_backoffice_admins_path
    click_link(id: 'editar')
    sleep 1
    fill_in(id: 'admin_email', with: 'edit@id.uff.br')
    fill_in(id: 'admin_password', with: '000000')
    fill_in(id: 'admin_password_confirmation', with: '000000')
    sleep 1
    click_button 'Salvar'
    expect(page).to have_content 'Administrador atualizado com sucesso!'
  end

  scenario 'Apagando um admin', js: true do
    visit admins_backoffice_admins_path
    click_link(id: 'apagar')
    page.driver.browser.switch_to.alert.accept
    sleep 1
    # driver.switch_to.alert.accept
    sleep 1
    expect(page).to have_content 'Administrador excluido com sucesso!'
    expect(page).to_not have_content :admin
  end

end
