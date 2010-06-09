class AddAttachmentsAvatarToRecipient < ActiveRecord::Migration
  def self.up
    add_column :recipients, :avatar_file_name, :string
    add_column :recipients, :avatar_content_type, :string
    add_column :recipients, :avatar_file_size, :integer
    add_column :recipients, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :recipients, :avatar_file_name
    remove_column :recipients, :avatar_content_type
    remove_column :recipients, :avatar_file_size
    remove_column :recipients, :avatar_updated_at
  end
end
