require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'モデルのテスト' do
    context "新規登録について" do
      before do
        @user = build(:user)
      end
      
      it "必要項目が存在すれば有効" do
        expect(@user).to be_valid
      end

      it "nameがないと無効" do
        @user.name = ""
        expect(@user).not_to be_valid
      end

      it "emailがないと無効" do
        @user.email = ""
        expect(@user).not_to be_valid
      end

      it "passwordがないと無効" do
        @user.password = ""
        expect(@user).not_to be_valid
      end

      it "名前が20文字より多いと無効" do
        @user.name = "hogehogehogehogehogehogehoge"
        expect(@user).not_to be_valid 
      end
    end
  end
end
