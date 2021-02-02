require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user sign up" do
    before do
      @user = FactoryBot.build(:user)
    end

    context "登録できる" do
      it "全て正しく入力できていれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "登録できない" do
      it "nicnameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameが入力されていません")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailが入力されていません")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordが入力されていません")
      end
      it "paddword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationが内容と合っていません")
      end
      it "emaiに@がないと登録できない" do
        @user.email = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailは有効でありません")
      end
      it "emaiが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Emailは既に使用されています")
      end
      it "passwordが7文字以下だと登録できない" do
        @user.password = "111aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは、7 ~ 128文字以内の半角英数混合で入力してください")
      end
      it "passwordが128文字以上だと登録できない" do
        pass = "1a" + Faker::Internet.password(min_length: 127)
        @user.password = pass
        binding.pry
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは、7 ~ 128文字以内の半角英数混合で入力してください")
      end
      it "passwordが英字だけだと登録できない" do
        @user.password = "aaabbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは、7 ~ 128文字以内の半角英数混合で入力してください")
      end
      it "passwordが数字だけだと登録できない" do
        @user.password = "1111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは、7 ~ 128文字以内の半角英数混合で入力してください")
      end
      it "passwordとconfirmationが一致してないと登録できない" do
        @user.password = "111aaaaa"
        @user.password_confirmation = "222bbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationが内容と合っていません")
      end
    end

  end
end
