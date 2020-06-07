class Post < ApplicationRecord
  belongs_to :user
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations
  has_many :comments

  validates :title, presence: true
  validates :title, length: { maximum: 30 } 
  validates :title, exclusion: { in: %w( 死ね 殺す ) , message: 'に禁止ワードが含まれています' }
  validates :context, presence: true
  validates :context, length: { maximum: 400 }
  validates :context, exclusion: { in: %w( 死ね 殺す ) , message: 'に禁止ワードが含まれています' }

  # あとでまとめる
  # with_options presence: true do
  #   validates :name
  #   validates :email
  #   validates :address
  # end
end
