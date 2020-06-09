require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  before do
    create :user
  end

  it "Userのログイン後、Postsの投稿後、コメントできるか" do
    visit new_user_session_path
    fill_in 'email', with: 'test@test.jp'
    fill_in 'password', with: 'testtest'
    click_button 'ログイン'
    fill_in 'title', with: 'テスト'
    fill_in 'context', with: 'テストテスト'
    click_button '新規スレッド作成'
    fill_in '書き込む内容', with: 'レス'
    click_button '書き込む'
    expect(page).to have_content 'レス'
  end
end
