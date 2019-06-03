# == Schema Information
#
# Table name: question_tips
#
#  id          :integer          not null, primary key
#  question_id :integer
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionTip < ApplicationRecord

  belongs_to :question

end
