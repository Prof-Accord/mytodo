require 'rails_helper'

RSpec.describe "Users", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end
  describe "ルートパス" do
    context "ログインしていない時" do
      it "リンクの個数と内容が正しいこと" do
        visit root_path
        expect(page).to have_http_status(:success)
        expect(page).to have_link 'Mytodo', href: root_path, count: 1
        expect(page).to have_link '新規登録', href: signup_path, count: 1
        expect(page).to have_link 'ログイン', href: signin_path, count: 1
        expect(page).to have_button 'メールアドレスまたは電話番号でログイン'
        expect(page).to have_button 'Mytodoユーザー登録'
      end
    end
    context "ログインしている時" do
      it "リンクの個数と内容が正しいこと" do
        sign_in @user
        visit root_path
        expect(page).to have_link 'Mytodo', href: users_path, count: 1
        expect(page).to have_link 'プロフィール変更', href: edit_user_registration_path, count: 1
        expect(page).to have_link 'ログアウト', href: destroy_user_session_path, count: 1
        # expect(page).to have_button 'メールアドレスまたは電話番号でログイン'
        # expect(page).to have_button 'Mytodoユーザー登録'
      end
    end
  end
end
