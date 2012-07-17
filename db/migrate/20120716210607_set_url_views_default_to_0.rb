class SetUrlViewsDefaultTo0 < ActiveRecord::Migration
  def self.up
    change_column :urls, :url_views, :integer, :default => 0
  end
  def self.down
    # You can't currently remove default values in Rails
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
