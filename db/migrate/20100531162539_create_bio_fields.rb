class CreateBioFields < ActiveRecord::Migration
  def self.up
    create_table :bio_fields do |t|
      t.column :bio_id, :integer
      t.column :field_name, :string
      t.column :content, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :bio_fields
  end
end