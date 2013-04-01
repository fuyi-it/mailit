class DropPhones < ActiveRecord::Migration
  def self.up
    remove_column :customers, :phone
    remove_column :customers, :phone_h1
    remove_column :customers, :phone_h2
  end

  def self.down
    add_column :customers, :phone, :string
    add_column :customers, :phone_h1, :string
    add_column :customers, :phone_h2, :string
  end
end
