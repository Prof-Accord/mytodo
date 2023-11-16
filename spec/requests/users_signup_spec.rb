require 'rails_helper'

RSpec.describe "新規登録", type: :request do
  it '誤った情報で登録できないこと' do
    get new_user_registration_path
    expect do
      post users_path, params: { user: { username: "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar" } }
    end.to change(User, :count).by(0)
    expect(response).to have_http_status(:unprocessable_entity)
    expect(css_select('#error_explanation').text).to include('ユーザーネーム は空です。')
  end
end
