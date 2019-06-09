class AddSrcVideoToUserQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :user_questions, :src_video, :string
  end
end
