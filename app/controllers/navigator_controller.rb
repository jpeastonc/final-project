class NavigatorController < ApplicationController
  
  def home
    render("navigation/home.html.erb")
  end
  
  def question_history
    @user_questions = UserQuestion.where({ :user_id => current_user.id})
    render("navigation/question_history.html.erb")
    
  end
  
  def full_mock
    #here I need to select the questions
    interview_type = params.fetch("interview_type")
    #need to add intelligence here / add interview type!
    questions =Question.where.not({ :id => current_user.user_questions.pluck(:question_id)})
    
    #check if there are at least 4 questions if not just pick 4 random no mater if they are repeated
    if(questions.count()<4)
      questions =Question.all
    end
    
    #Pick 4 random questions
    selected_questions = questions.to_a.sample(4)
    session[:q1_id] = selected_questions[0].id
    session[:q2_id] = selected_questions[1].id
    session[:q3_id] = selected_questions[2].id
    session[:q4_id] = selected_questions[3].id
    @cq=selected_questions[0]
    session[:question_number] = 1
    render("navigation/answer_question.html.erb")
  end
  
  def save_user_question
     
     srcvideotosave = params.fetch("srcvideotosave")
     uq = UserQuestion.new
     evaluation = Evaluation.new
     
     #save user question
     session[:question_number] = session[:question_number] + 1
     
    if(session[:question_number]<=4)
        if(session[:question_number] ==2)
          cs_id = session[:q1_id]
          @cq= Question.where({ :id => session[:q2_id] }).first
        elsif (session[:question_number] ==3)
          cs_id = session[:q2_id]
          @cq= Question.where({ :id => session[:q3_id] }).first
        elsif (session[:question_number] ==4)
          cs_id = session[:q3_id]
          @cq= Question.where({ :id => session[:q4_id] }).first
        end
          uq.question_id = cs_id
          uq.user_id = current_user.id
          uq.src_video=params.fetch("srcvideotosave")
          
          if (uq.save)
            evaluation.comment = params.fetch("comment")
            evaluation.rating = params.fetch("rating")
            evaluation.user_question_id = uq.id
            evaluation.save
          end
          
          render("navigation/answer_question.html.erb")
    else
          cs_id = session[:q4_id]
          uq.question_id = cs_id
          uq.user_id = current_user.id
          uq.src_video=params.fetch("srcvideotosave")
          uq.save
          session[:question_number] = 0
          render("navigation/end_mock.html.erb")
    end
     
  end
  
  def practice_interview_questions
    render("navigation/practice_interview_questions.html.erb")
  end
  
  def run_practice_question
    categories_ids = params.fetch("categories")
    n_questions = params.fetch("n_questions")
    
    categories = Category.where({:id => categories_ids})
    
    #Create hash and add all the questions
    questions = Hash.new
    categories.each do |cat|
      questions.merge(cat.questions_in_category)
    end

    non_repeated_questions = questions.where.not({ :id => current_user.user_questions.pluck(:question_id)})
    possible_questions = non_repeated_questions
    
    #check if there are at least 4 questions if not just pick 4 random no mater if they are repeated
    if(non_repeated_questions.count()<n_questions)
      if(questions.count()<n_questions)
        Question.all
      else
        possible_questions = questions
      end
    end
    
    #Pick n questions
    selected_questions = possible_questions.to_a.sample(n_questions)
    
    selected_questions.each_with_index do |q,index|
      session[index] = q.id
    end

    @cq=selected_questions[0]
    session[:question_number] = 1
    render("navigation/answer_question.html.erb")
    
  end
  

end