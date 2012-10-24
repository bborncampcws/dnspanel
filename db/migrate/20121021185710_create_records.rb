class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :source
      t.string :type
      t.string :target
      t.references :zone

      t.timestamps
    end
    add_index :records, :zone_id
  end
end
