class CreatePhoneNumbersKinds < ActiveRecord::Migration
  def self.up
    create_table :phone_kinds do |t|
      t.string   :kind
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :phone_numbers do |t|
      t.string   :number
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :phone_kind_id
      t.integer  :customer_id
    end
    add_index :phone_numbers, [:phone_kind_id]
    add_index :phone_numbers, [:customer_id]

    remove_column :tutorials, :t_use
  end

  def self.down
    add_column :tutorials, :t_use, :text

    drop_table :phone_kinds
    drop_table :phone_numbers
  end
end
