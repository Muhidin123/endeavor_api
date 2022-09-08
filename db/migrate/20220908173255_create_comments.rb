class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :trip_id, foreign_key: true
      t.integer :parent_id

      t.timestamps
    end
  end
end
