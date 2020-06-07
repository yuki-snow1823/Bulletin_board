class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :context, presence: true
  validates :context, length: { maximum: 400 }
  validates :context, exclusion: { in: %w( 死ね 殺す ) , message: 'に禁止ワードが含まれています' }
end
