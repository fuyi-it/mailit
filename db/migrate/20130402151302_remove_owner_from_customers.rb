class RemoveOwnerFromCustomers < ActiveRecord::Migration
  def self.up
    add_column :customers, :owner_id, :integer

    add_index :customers, [:owner_id]
  end

  def self.down
    remove_column :customers, :owner_id

    remove_index :customers, :name => :index_customers_on_owner_id rescue ActiveRecord::StatementInvalid
  end
end
