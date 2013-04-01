class RenameNumberToName < ActiveRecord::Migration
  def self.up
    rename_column :phone_numbers, :number, :name
  end

  def self.down
    rename_column :phone_numbers, :name, :number
  end
end
