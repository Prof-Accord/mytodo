require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = build(:user)
    end
    context "nameのバリデーション" do
      it "有効である" do
        expect(@user).to be_valid
      end
      it "存在しなくてはならない" do
        @user.name = "    "
        expect(@user).to be_invalid
      end
      it "50文字以下である" do
        @user.name = "a" * 51
        expect(@user).to be_invalid
      end
    end
    context "emailのバリデーション" do
      it "存在しなくてはならない" do
        @user.email = "   "
        expect(@user).to be_invalid
      end
      it "50文字以下である" do
        @user.name = "a" * 244 + "example.com"
        expect(@user).to be_invalid
      end
    end
  end
end
