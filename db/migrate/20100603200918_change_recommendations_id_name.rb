class ChangeRecommendationsIdName < ActiveRecord::Migration
  def self.up
    remove_column :recommendations, :recipient_id
    add_column :recommendations, :recommended_id, :string
  end

  def self.down
    remove_column :recommendations, :recommended_id
    add_column :recommendations, :recipient_id, :string
  end
end
