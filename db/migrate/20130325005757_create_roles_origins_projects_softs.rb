class CreateRolesOriginsProjectsSofts < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string   :name
      t.string   :contact
      t.string   :http
      t.string   :qq_group
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :softs do |t|
      t.string   :name
      t.string   :download
      t.string   :register
      t.string   :run
      t.text     :memo
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :project_id
    end
    add_index :softs, [:project_id]

    create_table :origins do |t|
      t.string   :name
      t.string   :detail
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :roles do |t|
      t.string   :name
      t.string   :detail
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :customers, :origin_id, :integer

    add_column :users, :role_id, :integer

    add_index :customers, [:origin_id]

    add_index :users, [:role_id]
  end

  def self.down
    remove_column :customers, :origin_id

    remove_column :users, :role_id

    drop_table :projects
    drop_table :softs
    drop_table :origins
    drop_table :roles

    remove_index :customers, :name => :index_customers_on_origin_id rescue ActiveRecord::StatementInvalid

    remove_index :users, :name => :index_users_on_role_id rescue ActiveRecord::StatementInvalid
  end
end
