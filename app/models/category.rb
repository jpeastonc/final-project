# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  category_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Category < ApplicationRecord
  
  has_many :question_categories, :dependent => :destroy
  has_many :questions, :through => :question_categories, :source => :question
  
  def questions_in_category
    question_ids = QuestionCategory.where({:category_id => self.id}).pluck(:question_id)
    return Question.where({:id =>question_ids})
  end

end
