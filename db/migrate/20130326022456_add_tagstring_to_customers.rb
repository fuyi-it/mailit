class AddTagstringToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :tagstring, :string
  end

  def self.down
    remove_column :customers, :tagstring
  end
end
