require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = include("@")
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = !"ab12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = !@user.password_confirmation
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.family_name = ""
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "First name can't be blank")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.family_name = 'A', '1', '@'
      @user.first_name = 'A', '1', '@'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "First name kana can't be blank")
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.family_name_kana = ""
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", "First name kana can't be blank")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.family_name_kana = "ｶﾅ"
      @user.first_name_kana = "ｶﾅ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "First name can't be blank")
    end
    it "生年月日が必須であること" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
