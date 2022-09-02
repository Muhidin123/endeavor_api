class CreateCheckpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :checkpoints do |t|
      t.string :title, null: false, limit: 100, index: true, default: ''
      t.text :description, null: false, default: '', index: true
      t.datetime :start, null: false, default: DateTime.now
      t.datetime :end, null: false, default:  DateTime.now
      t.float :longitude, null: false, default: 0.0
      t.float :latitude, null: false, default: 0.0
      t.float :longitude_delta, null: false, default: 0.0
      t.float :latitude_delta, null: false, default: 0.0
      t.string :location, null: false, default: 'Unknown', limit: 100, index: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
