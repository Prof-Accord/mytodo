require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    let(:user) { create(:user) }

    context 'nameのバリデーション' do
      it '有効であること' do
        expect(user).to be_valid
      end
      it '存在すること' do
        user.username = '    '
        expect(user).to be_invalid
      end
      it '50文字以下であること' do
        # usernameの長さを51文字に設定
        user.username = 'a' * 51
        expect(user).to be_invalid
      end
    end

    context 'emailのバリデーション' do
      it '存在すること' do
        user.email = '   '
        expect(user).to be_invalid
      end
      it '255文字以下であること' do
        # emailの長さを256文字に設定
        user.email = ('a' * 244) + '@example.com'
        expect(user).to be_invalid
      end
      it 'フォーマットの検証（有効である）' do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid, "#{valid_address.inspect} が無効判定"
        end
      end
      it 'フォーマットの検証（無効である）' do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).to be_invalid, "#{invalid_address.inspect} が有効判定"
        end
      end
      it 'emailがユニークであること' do
        duplicate_user = user.dup
        user.save
        expect(duplicate_user).to be_invalid
      end
    end

    context 'passwordのバリデーション' do
      it '存在すること' do
        user.password = user.password_confirmation =  '   '
        expect(user).to be_invalid
      end
      it '6文字以上であること' do
        user.password = user.password_confirmation = 'a' * 5
        expect(user).to be_invalid
      end
    end
  end
end