class AddTypeToRecommendations < ActiveRecord::Migration
  def self.up
    add_column :recommendations, :recommended_type, :string
  end

  def self.down
    remove_column :recommendations, :recommended_type
  end
end
