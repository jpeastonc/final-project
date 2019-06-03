class AddAcceptedToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :accepted, :boolean
    add_column :questions, :user_id, :integer
  end
end
