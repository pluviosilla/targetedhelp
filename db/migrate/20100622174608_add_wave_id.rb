class AddWaveId < ActiveRecord::Migration
  def self.up
    add_column :recipients, :wave_id, :string
  end

  def self.down
    remove_column :recipients, :wave_id
  end
end
