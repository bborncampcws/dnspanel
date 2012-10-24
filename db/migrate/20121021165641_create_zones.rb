class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :defaultIp
      t.string :domain
      t.integer :serial

      t.timestamps
    end
  end
end
