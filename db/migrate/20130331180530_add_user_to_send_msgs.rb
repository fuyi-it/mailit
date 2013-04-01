class AddUserToSendMsgs < ActiveRecord::Migration
  def self.up
    add_column :send_msgs, :user_id, :integer

    add_index :send_msgs, [:user_id]
  end

  def self.down
    remove_column :send_msgs, :user_id

    remove_index :send_msgs, :name => :index_send_msgs_on_user_id rescue ActiveRecord::StatementInvalid
  end
end
