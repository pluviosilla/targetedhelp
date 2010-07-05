class RemoveDeviseUser < ActiveRecord::Migration
  def self.up
    drop_table :users
  end

  def self.down
    drop_table :users
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable

      t.timestamps
    end
  end
end
