class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :image_id
      t.text :body

      t.timestamps
    end
  add_index :comments, :user_id
  add_index :comments, :image_id

  end
end
