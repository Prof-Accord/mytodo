require 'rails_helper'

describe Users::RegistrationsController, type: :request do
  describe 'get #new' do
    it 'アクセスに成功すること' do
      get new_user_registration_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include '新規登録'
      expect(response.body).to include 'ログイン'
    end
  end
end
