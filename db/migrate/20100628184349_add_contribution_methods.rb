class AddContributionMethods < ActiveRecord::Migration
  def self.up
    add_column :bios, :contribution_methods, :text
  end

  def self.down
    remove_column :bios, :contribution_methods
  end
end
