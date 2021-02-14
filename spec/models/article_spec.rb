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
          @article.image = nil
          @article.valid?
          expect(@article.errors.full_messages).to include("Imageが入力されていません")
        end
        it 'titleがない' do
          @article.title = nil
          @article.valid?
          expect(@article.errors.full_messages).to include("Titleが入力されていません")
        end
        it 'textがない' do
          @article.text = nil
          @article.valid?
          expect(@article.errors.full_messages).to include("Textが入力されていません")
        end
        it 'buy_settingがない' do
          @article.buy_setting = nil
          @article.valid?
          expect(@article.errors.full_messages).to include("Buy settingが選択されていません")
        end
        it 'buy_settingがtrueなのにpriceがない' do
          @article.buy_setting = true
          @article.price = ""
          @article.valid?
          expect(@article.errors.full_messages).to include("Priceが入力されていません")
        end
        it 'priceが100円以下' do
          @article.buy_setting = true
          @article.price = 50
          @article.valid?
          expect(@article.errors.full_messages).to include("Priceは¥100〜9,999,999に設定してください")
        end
        it 'priceが9,999,999万円以上' do
          @article.buy_setting = true
          @article.price = 10000000
          @article.valid?
          expect(@article.errors.full_messages).to include("Priceは¥100〜9,999,999に設定してください")
        end
        it 'priceが半角数字でない' do
          @article.buy_setting = true
          @article.price = "aaaa"
          @article.valid?
          expect(@article.errors.full_messages).to include("Priceは半角数字で入力してください","Priceは¥100〜9,999,999に設定してください")
        end
        it 'userがひもづいていない' do
          @article.user = nil
          @article.valid?
          expect(@article.errors.full_messages).to include("Userを入力してください")
        end
      
    end

  end
end
