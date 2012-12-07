class CreateZoneUpdaters < ActiveRecord::Migration
  def change
    create_table :zone_updaters do |t|
      t.references :zone
      t.string :algorithim
      t.string :key
      t.string :server

      t.timestamps
    end
    add_index :zone_updaters, :zone_id
  end
end
