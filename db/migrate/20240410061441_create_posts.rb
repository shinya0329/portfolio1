class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :shop_name
      t.string :image_id
      t.text :caption
      t.string :category
      t.integer :user_id

      t.timestamps
    end
  end
end
