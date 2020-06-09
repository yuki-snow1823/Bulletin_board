class ChangeDataPostIdToPostCategoryRelations < ActiveRecord::Migration[6.0]
  def change
      change_column :post_category_relations, :post_id, 'post_id USING CAST(hoge AS integer)'
  end
end
