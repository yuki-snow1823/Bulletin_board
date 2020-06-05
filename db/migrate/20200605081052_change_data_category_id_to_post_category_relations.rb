class ChangeDataCategoryIdToPostCategoryRelations < ActiveRecord::Migration[6.0]
  def change
      change_column :post_category_relations, :category_id, :integer
  end
end
