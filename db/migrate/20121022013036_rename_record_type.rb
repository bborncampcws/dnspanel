class RenameRecordType < ActiveRecord::Migration
  def up
    rename_column :records, :type, :recordType
  end

  def down
  end
end
