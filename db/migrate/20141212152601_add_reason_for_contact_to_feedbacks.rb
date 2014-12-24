class AddReasonForContactToFeedbacks < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :reason_for_contact, :string, :limit=>50
  end
end
