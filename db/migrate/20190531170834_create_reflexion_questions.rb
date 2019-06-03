class CreateReflexionQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :reflexion_questions do |t|
      t.integer :question_id
      t.string :reflexion_question

      t.timestamps
    end
  end
end
