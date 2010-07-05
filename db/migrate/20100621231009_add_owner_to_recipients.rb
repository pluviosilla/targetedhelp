class AddOwnerToRecipients < ActiveRecord::Migration
  def self.up
   add_column :recipients, :user_id, :integer
  end

  def self.down
    remove_column :recipients, :user_id
  end
end
