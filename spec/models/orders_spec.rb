require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '記事購入' do
    before do
      article = FactoryBot.create(:article)
      buyer = FactoryBot.create(:user)
      @order = FactoryBot.build(:order, user_id: buyer.id, article_id: article.id)
      sleep(0.1)
    end

    context '購入できる' do
      it 'すべて正しく入力できている' do
        expect(@order).to be_valid
      end
    end

    context '購入できない' do
      it 'f_nameが空' do
        @order.f_name = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("名前が入力されていません")
      end
      it 'f_nameが全角でない' do
        @order.f_name = "abcdef"
        @order.valid?
        expect(@order.errors.full_messages).to include("名前は、全角で入力してください")
      end
      it 'l_nameが空' do
        @order.l_name = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("名字が入力されていません")
      end
      it 'l_nameが全角でない' do
        @order.l_name = "abcdef"
        @order.valid?
        expect(@order.errors.full_messages).to include("名字は、全角で入力してください")
      end
      it 'f_name_kanaが空' do
        @order.f_name_kana = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("名前のふりがなが入力されていません")
      end
      it 'f_name_kanaがカタカナ' do
        @order.f_name_kana = "テスト"
        @order.valid?
        expect(@order.errors.full_messages).to include("名前のふりがなは、ひらがなで入力してください")
      end
      it 'f_name_kanaが半角' do
        @order.f_name_kana = "abcdef"
        @order.valid?
        expect(@order.errors.full_messages).to include("名前のふりがなは、ひらがなで入力してください")
      end
      it 'l_name_kanaが空' do
        @order.l_name_kana = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("名字のふりがなが入力されていません")
      end
      it 'l_name_kanaがカタカナ' do
        @order.l_name_kana = "テスト"
        @order.valid?
        expect(@order.errors.full_messages).to include("名字のふりがなは、ひらがなで入力してください")
      end
      it 'l_name_kanaが半角' do
        @order.l_name_kana = "abcdef"
        @order.valid?
        expect(@order.errors.full_messages).to include("名字のふりがなは、ひらがなで入力してください")
      end
      it 'postal_codeが空' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号が入力されていません")
      end
      it 'postal_codeが全角' do
        @order.postal_code = "１２３−４５６７"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は、-を含む半角数字で入力してください")
      end
      it 'postal_codeが-なし' do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は、-を含む半角数字で入力してください")
      end
      it 'postal_codeが数字でない' do
        @order.postal_code = "abcdef"
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号は、-を含む半角数字で入力してください")
      end
      it 'prefecture_idが空' do
        @order.prefecture_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県が入力されていません")
      end
      it 'prefecture_idが0' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空' do
        @order.city = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町村が入力されていません")
      end
      it 'building_numberが空' do
        @order.building_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("番地が入力されていません")
      end
      it 'building_nameが空' do
        @order.building_name = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("建物が入力されていません")
      end
      it 'phone_numberが空' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号が入力されていません")
      end
      it 'phone_numberが全角' do
        @order.phone_number = "０９０１２３４１２３４"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は、半角数字で入力してください")
      end
      it 'phone_numberが数字でない' do
        @order.phone_number = "aaaaaaaaaaa"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は、半角数字で入力してください")
      end
      it 'phone_numberが11桁以上' do
        @order.phone_number = "090123123123123"
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は、11桁以内で入力してください")
      end
      it 'tokenが空' do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("トークンが入力されていません")
      end
      it 'articleが紐付いてない' do
        @order.article_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Articleが入力されていません")
      end
      it 'userが紐付いてない' do
        @order.user_id = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Userが入力されていません")
      end
    end

  end
end
