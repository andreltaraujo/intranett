require 'rails_helper'

RSpec.feature 'Welcome (Tela de Inicio)', type: :feature do
  scenario 'GET #Index works fine!' do
    visit(root_path)
    expect(page).to have_content('Bem-Vindo!')
  end
  scenario 'Verifica link Login' do
    visit(root_path)
    click_on('Login')
    expect(page).to have_content('email')
  end
end
