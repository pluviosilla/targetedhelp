class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.string :contributor_name
      t.string :amount
      t.string :recipient_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
