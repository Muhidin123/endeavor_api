class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|

      t.string :username, null: false, unique: true, index: true, limit: 32
      t.string :email, null: false, unique: true, index: true, limit: 64
      t.string :password_digest, null: false, limit: 64
      t.text :bio, limit: 500, default: '', null: false
      t.string :avatar
      t.string :first_name, limit: 32, default: '', null: false
      t.string :last_name, limit: 32, default: '', null: false
      t.string :location, limit: 32, default: '', null: false
      t.datetime :birthday, null: false, default: DateTime.now
      t.boolean :admin, default: false, null: false

      t.timestamps
    end
  end
end
