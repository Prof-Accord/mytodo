require 'rails_helper'

RSpec.describe "新規登録", type: :request do
  before do
    @user = create(:user)
  end
  it '誤った情報で登録できないこと' do
    get signup_path
    expect do
      post users_path, params: { user: { username: "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar" } }
    end.to change(User, :count).by(0)
    # follow_redirect!
    expect(response).to render_template 'registrations/new'
    expect(response).to have_http_status(:unprocessable_entity)
    expect(css_select('#error_explanation').text).to include('ユーザーネーム は空です。')
  end
  it '有効な情報で登録できること' do
    get new_user_registration_path
    expect do
      post users_path, params: { user: { username: "Example User",
                                         email: "user@example.com",
                                         password: "password",
                                         password_confirmation: "password" } }
    end.to change(User, :count).by(1)
    follow_redirect!
    # ユーザーのTodo一覧ページを表示
    expect(response).to render_template 'users/show'
    expect(response).to have_http_status(:success)
    # expect(css_select('#error_explanation').text).to include('ユーザーネーム は空です。')
  end
end
