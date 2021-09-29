class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.references :likeable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
