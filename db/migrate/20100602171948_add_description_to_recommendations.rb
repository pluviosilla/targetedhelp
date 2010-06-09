class AddDescriptionToRecommendations < ActiveRecord::Migration
  def self.up
    add_column :recommendations, :description, :string
  end

  def self.down
    remove_column :recommendations, :description
  end
end
