require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe "Todo" do
    let!(:todo) { create(:todo, created_at: 2.hours.ago) }
    let!(:most_recent) { create(:most_recent, created_at: 1.hour.ago) }
    let!(:potato) { create(:potato, created_at: Time.zone.now) }

    context "todoのバリデーション" do
      it "有効であること" do
        expect(todo).to be_valid
      end
      it "user_idが有効であること" do
        todo.user_id = nil
        expect(todo).to be_invalid
      end
      it "Timeのテスト" do
        expect(todo).to eq(Todo.third)
      end
    end
  end
end
