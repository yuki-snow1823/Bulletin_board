class ChangeDataCategoryIdToPostCategoryRelations < ActiveRecord::Migration[6.0]
  def change
      change_column :post_category_relations, :category_id, 'integer USING CAST(category_id AS integer)'
  end
end
