class FamilyEconomicsToText < ActiveRecord::Migration
  def self.up
    remove_column :bios, :family_economics
    add_column :bios, :family_economics, :text
  end

  def self.down
    remove_column :bios, :family_economics
    add_column :bios, :family_economics, :string
  end
end
