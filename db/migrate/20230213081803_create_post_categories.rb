class CreatePostCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :post_categories do |t|
      t.string :title, index: true, null: false

      t.timestamps
    end
  end
end
