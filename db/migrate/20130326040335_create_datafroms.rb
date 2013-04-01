class CreateDatafroms < ActiveRecord::Migration
  def self.up
    rename_table :origins, :datafroms

    rename_column :customers, :origin_id, :datafrom_id

    remove_index :customers, :name => :index_customers_on_origin_id rescue ActiveRecord::StatementInvalid
    add_index :customers, [:datafrom_id]
  end

  def self.down
    rename_column :customers, :datafrom_id, :origin_id

    rename_table :datafroms, :origins

    remove_index :customers, :name => :index_customers_on_datafrom_id rescue ActiveRecord::StatementInvalid
    add_index :customers, [:origin_id]
  end
end
