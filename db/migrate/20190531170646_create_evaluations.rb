class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :rating
      t.string :comment
      t.integer :user_question_id

      t.timestamps
    end
  end
end
