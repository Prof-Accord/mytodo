require 'rails_helper'

RSpec.describe User, type: :model do
  context "Userモデルのテスト" do
    it "emailのバリデーション" do
      user = User.new(name: "",
                      email: "",
                      password: "password",
                      password_confirmation: "password")
      expect(user).to be_invalid
    end
  end
end
