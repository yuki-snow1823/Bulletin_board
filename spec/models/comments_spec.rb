require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'モデルのテスト' do
    context "新規登録について" do
      before do
        @comment = build(:comment)
      end
      
      it "必要項目が存在すれば有効" do
        expect(@comment).to be_valid
      end

      it "contextがないと無効" do
        @comment.context = ""
        expect(@comment).not_to be_valid
      end

      it "contextに禁止ワードを含んでいると無効" do
        @comment.context = "死ね"
        expect(@comment).not_to be_valid 
      end

      it "contextが400字より多いと無効" do
        @comment.context = "hoge" * 101
        expect(@comment).not_to be_valid
      end
    end
  end
end
