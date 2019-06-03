# == Schema Information
#
# Table name: evaluations
#
#  id               :integer          not null, primary key
#  rating           :integer
#  comment          :string
#  user_question_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Evaluation < ApplicationRecord
  
  belongs_to :user_question
  has_one :user, :through => :user_question, :source => :user
  
end
