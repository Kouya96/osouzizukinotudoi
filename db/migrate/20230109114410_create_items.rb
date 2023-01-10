class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps

      t.integer :user_id, null: false
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.float :star, null: false

    end
  end
end
