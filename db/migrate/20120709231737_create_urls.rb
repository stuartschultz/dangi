class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.string :short_url
      t.integer :url_views
      t.integer :user_id

      t.timestamps
    end
  end
end
