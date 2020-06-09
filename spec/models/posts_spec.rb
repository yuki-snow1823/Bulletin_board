require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'モデルのテスト' do
    context "新規登録について" do
      before do
        @post = build(:post)
      end
      
      it "必要項目が存在すれば有効" do
        expect(@post).to be_valid
      end

      it "titleがないと無効" do
        @post.title = ""
        expect(@post).not_to be_valid
      end

      it "contextがないと無効" do
        @post.context = ""
        expect(@post).not_to be_valid
      end

      it "titleに禁止ワードを含んでいると無効" do
        @post.title = "死ね"
        expect(@post).not_to be_valid 
      end

      it "contextに禁止ワードを含んでいると無効" do
        @post.context = "死ね"
        expect(@post).not_to be_valid 
      end

      it "titleが30字より多いと無効" do
        @post.title = "hoge" * 8
        expect(@post).not_to be_valid
      end

      it "contextが400字より多いと無効" do
        @post.context = "hoge" * 101
        expect(@post).not_to be_valid
      end
    end
  end
end
