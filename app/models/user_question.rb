# == Schema Information
#
# Table name: user_questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  question_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  src_video   :string
#

class UserQuestion < ActiveRecord::Base
  
  belongs_to :question
  belongs_to :user
  has_one :evaluation, :dependent => :destroy
  mount_uploader :src_video,  VideoUploader
  
end
