require 'rails_helper'

RSpec.describe "Users", type: :feature do
  let!(:user) { create(:user) }

  context 'ユーザー新規登録ができるとき' do
    xit '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit user_path(user)
      expect(page).to have_content user.username
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # ユーザー情報を入力する
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      # トップページへ遷移する
      # カーソルを合わせるとログアウトボタンが表示されることを確認する
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
    end
  end
end
