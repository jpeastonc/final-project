# == Schema Information
#
# Table name: question_categories
#
#  id          :integer          not null, primary key
#  question_id :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionCategory < ApplicationRecord
  
  belongs_to :question
  belongs_to :category
  
end
