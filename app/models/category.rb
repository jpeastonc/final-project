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
  
end
