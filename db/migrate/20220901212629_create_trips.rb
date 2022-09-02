class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :title, null: false, limit: 100, index: true, default: ''
      t.text :description, null: false, default: '', index: true, limit: 1000
      t.datetime :start, null: false, default: DateTime.now
      t.datetime :end, null: false, default: DateTime.now
      t.float :longitude, null: false
      t.float :latitude, null: false
      t.float :longitude_delta, null: false
      t.float :latitude_delta, null: false
      t.string :location, null: false, default: 'Unknown', limit: 100, index: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
