class ChangeDataPostIdToPostCategoryRelations < ActiveRecord::Migration[6.0]
  def change
      change_column :post_category_relations, :post_id, :integer
  end
end

