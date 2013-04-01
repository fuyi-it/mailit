class CreateAccountAdapterSmsParams < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string   :name
      t.string   :account
      t.string   :password
      t.integer  :balance
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :customer_id
      t.integer  :adapter_id
    end
    add_index :accounts, [:customer_id]
    add_index :accounts, [:adapter_id]

    create_table :adapters do |t|
      t.string   :name
      t.string   :account_agent
      t.string   :password
      t.integer  :balance
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :sms_params do |t|
      t.string   :name
      t.string   :kind
      t.string   :url
      t.string   :user
      t.string   :pwd
      t.string   :msg
      t.string   :mobile
      t.string   :encode
      t.string   :url_other
      t.boolean  :is_post
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :adapter_id
    end
    add_index :sms_params, [:adapter_id]
  end

  def self.down
    drop_table :accounts
    drop_table :adapters
    drop_table :sms_params
  end
end
