class CreateSendMsgs < ActiveRecord::Migration
  def self.up
    create_table :send_msgs do |t|
      t.string   :title
      t.text     :msg
      t.text     :mobile
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :send_msgs
  end
end
