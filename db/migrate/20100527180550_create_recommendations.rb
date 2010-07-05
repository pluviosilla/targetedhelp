
class CreateRecommendations < ActiveRecord::Migration
  def self.up
    create_table :recommendations do |t|
      t.column :recipient_id, :integer
      t.column :recommendor_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :recommendations
  end
end
