require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '記事購入' do
    before do
      article = FactoryBot.create(:article)
      buyer = FactoryBot.create(:user)
      @order = FactoryBot.build(:order, user_id: buyer.id, article_id: article.id)
    end

    context '購入できる' do
      it 'すべて正しく入力できている' do
        binding.pry
        expect(@order).to be_valid
      end
    end
  end
end
