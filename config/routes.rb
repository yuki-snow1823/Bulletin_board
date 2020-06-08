Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create]
  end
  # コメント投稿エラー時に更新してもルーティングエラーにさせないために記載しています。
  get '/posts/:id/comments', to: 'posts#show'
end
