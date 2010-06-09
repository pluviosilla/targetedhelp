class ChangeDescriptionFromStringToText < ActiveRecord::Migration
  def self.up
    remove_column :recommendations, :description
    add_column :recommendations, :description, :text
  end

  def self.down
    remove_column :recommendations, :description
    add_column :recommendations, :description, :string
  end
end
