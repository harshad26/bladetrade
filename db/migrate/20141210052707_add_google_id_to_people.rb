class AddGoogleIdToPeople < ActiveRecord::Migration
  def change
  	add_column :people, :google_id, :string
  end
end
