class AddAcceptedToQuestiontip < ActiveRecord::Migration[5.1]
  def change
    add_column :question_tips, :accepted, :boolean
    add_column :question_tips, :user_id, :integer
  end
end
