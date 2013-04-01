class ChangeAccountBlongsToUser < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :customer_id, :user_id

    remove_index :accounts, :name => :index_accounts_on_customer_id rescue ActiveRecord::StatementInvalid
    add_index :accounts, [:user_id]
  end

  def self.down
    rename_column :accounts, :user_id, :customer_id

    remove_index :accounts, :name => :index_accounts_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :accounts, [:customer_id]
  end
end
