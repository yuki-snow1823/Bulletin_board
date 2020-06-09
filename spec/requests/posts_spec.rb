require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let!(:user) { create :user }

  describe 'GET posts#index' do
    context 'ユーザでログインしている場合' do
      before do
        @user = build(:user)
        sign_in @user
      end

      it '正常なレスポンスを返すこと' do
        get posts_path user
        expect(response.status).to eq 200
      end
    end
  
    context 'ユーザでログインしていない場合' do
      before do
        @user = build(:user)
      end

      it 'リダイレクトされること' do
        get posts_path user
        expect(response.body).to include "アカウント登録もしくはログインしてください。"
      end
    end
  end

  describe "POST posts#create" do
    context '正常なパラメーターの場合' do
       it 'リクエストが成功すること' do
         post posts_path, params: { post: attributes_for(:post, user: :user) }
         expect(response.status).to eq 302
       end
    end
  end
end
