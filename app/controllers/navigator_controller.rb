class NavigatorController < ApplicationController
  
  def home
    render("navigation/home.html.erb")
  end
  
  def full_mock
    #here I need to select the questions
    interview_type = params.fetch("interview_type")
    #need to add intelligence here / add interview type!
    questions =Question.where.not({ :id => current_user.user_questions.pluck(:question_id) })
    @q1 = questions.at(0).question
    render("navigation/full_mock.html.erb")
  end


end