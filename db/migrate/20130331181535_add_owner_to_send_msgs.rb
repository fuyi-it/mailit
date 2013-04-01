class AddOwnerToSendMsgs < ActiveRecord::Migration
  def self.up
    rename_column :send_msgs, :user_id, :owner_id

    remove_index :send_msgs, :name => :index_send_msgs_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :send_msgs, [:owner_id]
  end

  def self.down
    rename_column :send_msgs, :owner_id, :user_id

    remove_index :send_msgs, :name => :index_send_msgs_on_owner_id rescue ActiveRecord::StatementInvalid
    add_index :send_msgs, [:user_id]
  end
end
