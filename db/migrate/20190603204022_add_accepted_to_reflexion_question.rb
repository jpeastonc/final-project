class AddAcceptedToReflexionQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :reflexion_questions, :accepted, :boolean
    add_column :reflexion_questions, :user_id, :integer
  end
end
