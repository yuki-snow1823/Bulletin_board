class ChangeDataPostIdToPostCategoryRelations < ActiveRecord::Migration[6.0]
  def change
      change_column :post_category_relations, :post_id, 'integer USING CAST(post_id AS integer)'
  end
end
