class AddPhoneUnitBalanceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :phone, :string
    add_column :users, :unit, :string
    add_column :users, :balance, :integer
  end

  def self.down
    remove_column :users, :phone
    remove_column :users, :unit
    remove_column :users, :balance
  end
end
