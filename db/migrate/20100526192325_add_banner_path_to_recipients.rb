class AddBannerPathToRecipients < ActiveRecord::Migration
  def self.up
    add_column :recipients, :banner_path, :string
  end

  def self.down
    remove_column :recipients, :banner_path
  end
end
