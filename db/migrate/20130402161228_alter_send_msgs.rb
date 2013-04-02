class AlterSendMsgs < ActiveRecord::Migration
  def self.up
    add_column :send_msgs, :num, :integer
    add_column :send_msgs, :balance, :integer
  end

  def self.down
    remove_column :send_msgs, :num
    remove_column :send_msgs, :balance
  end
end
