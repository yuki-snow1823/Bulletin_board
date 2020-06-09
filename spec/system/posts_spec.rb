require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    create :user
  end

  it "Userのログイン後、新規投稿できるか" do
    visit new_user_session_path
    fill_in 'email', with: 'test@test.jp'
    fill_in 'password', with: 'testtest'
    click_button 'ログイン'
    fill_in 'title', with: 'テスト'
    fill_in 'context', with: 'テストテスト'
    click_button '新規スレッド作成'
    expect(page).to have_content 'スレッドを投稿しました'
  end
end
