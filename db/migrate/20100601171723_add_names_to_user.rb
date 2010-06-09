class AddNamesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end

  def self.down
    remove_column :users, :firstname, :string
    remove_column :users, :lastname, :string
  end
end
