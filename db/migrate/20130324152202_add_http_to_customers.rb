class AddHttpToCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :http, :string
  end

  def self.down
    remove_column :customers, :http
  end
end
