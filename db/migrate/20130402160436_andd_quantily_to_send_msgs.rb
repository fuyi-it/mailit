class AnddQuantilyToSendMsgs < ActiveRecord::Migration
  def self.up
    add_column :send_msgs, :quantily, :integer
  end

  def self.down
    remove_column :send_msgs, :quantily
  end
end
