# frozen_string_literal: true

require 'rails_helper'
RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do

    it 'when logged out: return http status 302(not authorized)' do
      get :index
      expect(response).to have_http_status 302
    end
    it 'when logged in: return http status 200(success)' do
      user = create(:user)
      sign_in user
      get :index
      expect(response).to have_http_status 200
    end
  end
end