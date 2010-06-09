class AddCategoryIdToRecipients < ActiveRecord::Migration
  def self.up
    add_column :recipients, :category_id, :int
  end

  def self.down
    remove_column :recipients, :category_id
  end
end
