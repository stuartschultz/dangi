class AddShortUrlKeyColumnToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :short_url_key, :string
  end
end
