class RenameUserUrlToUre < ActiveRecord::Migration
  def self.up
    rename_column :tutorials, :t_user_url, :t_use_url
  end

  def self.down
    rename_column :tutorials, :t_use_url, :t_user_url
  end
end
