class AddGooglecredentialsToCommunities < ActiveRecord::Migration
  def change
  	add_column :communities, :google_connect_id, :string
  	add_column :communities, :google_connect_secret, :string
  end
end
