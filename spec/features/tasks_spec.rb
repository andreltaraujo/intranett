require 'rails_helper'

RSpec.feature 'Tasks', type: :feature do
  scenario 'Link Nova Tarefa' do
    visit(tasks_path)
  end
end
