require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe "Todo" do
    let(:user) { create(:user) }
    let!(:todo) { create(:todo) }
    let!(:most_recent) { create(:most_recent) }

    context "todoのバリデーション" do
      it "有効であること" do
        expect(todo).to be_valid
      end
      it "user_idが有効であること" do
        todo.user_id = nil
        expect(todo).to be_invalid
      end
      it "作成順の通りに並ぶことのテスト" do
        expect(most_recent).to eq(Todo.first)
      end
      it "ユーザーと紐づけられていること" do
        user.todos.create(title: 'テストタイトル', content: 'テスト本文')
        expect{ user.destroy }.to change(Todo, :count).from(3).to(2)
      end
    end
  end
end
