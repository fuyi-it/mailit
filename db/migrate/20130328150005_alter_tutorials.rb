class AlterTutorials < ActiveRecord::Migration
  def self.up
    add_column :tutorials, :title, :string
    add_column :tutorials, :download_url, :string
    add_column :tutorials, :category, :string
    remove_column :tutorials, :t_install
    remove_column :tutorials, :t_install_url
    remove_column :tutorials, :t_use_url
  end

  def self.down
    remove_column :tutorials, :title
    remove_column :tutorials, :download_url
    remove_column :tutorials, :category
    add_column :tutorials, :t_install, :text
    add_column :tutorials, :t_install_url, :string
    add_column :tutorials, :t_use_url, :string
  end
end
