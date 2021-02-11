require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#create' do
    before do
      @article = FactoryBot.build(:article)  
    end

    context '投稿できる' do
        it '全て正しく入力したら投稿できる' do
          expect(@article).to be_valid
        end
        it '無料(false)の時はpriceなしで投稿できる' do
          @article.buy_setting = false
          @article.price = nil
          expect(@article).to be_valid
        end
    end

    context '投稿できない' do
        it '画像がない' do
          
        end
        it 'titleがない' do
          
        end
        it 'textがない' do
          
        end
        it 'buy_settingがない' do
          
        end
        it 'buy_settingがtrueなのにpriceがない' do
          
        end
        it 'priceが半角数次でない' do
          
        end
        it 'priceが100円以下' do
          
        end
        it 'priceが9,999,999万円以上' do
          
        end
        it 'userがひもづいていない' do
          
        end
      
    end

  end
end
