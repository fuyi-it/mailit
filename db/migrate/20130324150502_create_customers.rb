class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string   :name
      t.string   :phone
      t.string   :phone_h1
      t.string   :phone_h2
      t.string   :email
      t.string   :qq
      t.text     :detail
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :customers
  end
end
