class SetUserIdDefaultTo0 < ActiveRecord::Migration
  def self.up
    change_column :urls, :user_id, :integer, :default => 0
  end
  def self.down
    # You can't currently remove default values in Rails
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
