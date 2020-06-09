class DeleteUserCommentRelation < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_comment_relations
  end
end
