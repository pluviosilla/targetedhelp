class CreateBios < ActiveRecord::Migration
  def self.up
    create_table :bios do |t|
      t.column :family_id, :integer
      t.column :recipient_id, :integer
      t.column :family_economics, :string

      t.timestamps
    end
  end

  def self.down
    drop_table :bios
  end
end
