class CreatePostCategoryRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :post_category_relations do |t|
      t.string :post_id
      t.string :category_id

      t.timestamps
    end
  end
end
