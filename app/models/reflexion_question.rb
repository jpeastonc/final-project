# == Schema Information
#
# Table name: reflexion_questions
#
#  id                 :integer          not null, primary key
#  question_id        :integer
#  reflexion_question :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ReflexionQuestion < ApplicationRecord
  
  belongs_to :question
  
end
