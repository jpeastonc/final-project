# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  
  has_many :question_categories, :dependent => :destroy
  has_many :tips, :class_name => "QuestionTip", :dependent => :destroy
  has_many :user_questions, :dependent => :destroy
  has_many :reflexion_questions, :dependent => :destroy
  
  has_many :categories, :through => :question_categories, :source => :category
  
end
