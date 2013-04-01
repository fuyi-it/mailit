class CreateTutorials < ActiveRecord::Migration
  def self.up
    create_table :tutorials do |t|
      t.string   :tech_info
      t.text     :detail
      t.text     :t_install
      t.string   :t_install_url
      t.text     :t_use
      t.string   :t_user_url
      t.text     :memo
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :soft_id
    end
    add_index :tutorials, [:soft_id]
  end

  def self.down
    drop_table :tutorials
  end
end
