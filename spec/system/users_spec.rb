require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    create :user
  end

  it "ユーザーが登録されている場合、ログインできるか" do
    # Capybaraによってブラウザを使った自動テストが走ります。
    visit new_user_session_path
    fill_in 'email', with: 'test@test.jp'
    fill_in 'password', with: 'testtest'
    click_button 'ログイン'
    
    expect(page).to have_content 'ログインしました。'
  end
end
