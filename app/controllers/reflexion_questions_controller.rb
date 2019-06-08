class ReflexionQuestionsController < ApplicationController
  def list
    @reflexion_questions = ReflexionQuestion.all

    render("reflexion_question_templates/list.html.erb")
  end

  def details
    @reflexion_question = ReflexionQuestion.where({ :id => params.fetch("id_to_display") }).first

    render("reflexion_question_templates/details.html.erb")
  end

  def blank_form
    @reflexion_question = ReflexionQuestion.new

    render("reflexion_question_templates/blank_form.html.erb")
  end

  def save_new_info
    @reflexion_question = ReflexionQuestion.new

    @reflexion_question.question_id = params.fetch("question_id")
    @reflexion_question.reflexion_question = params.fetch("reflexion_question")

    if @reflexion_question.valid?
      @reflexion_question.save

      redirect_to("/reflexion_questions", { :notice => "Reflexion question created successfully." })
    else
      render("reflexion_question_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @reflexion_question = ReflexionQuestion.where({ :id => params.fetch("id_to_prefill") }).first

    render("reflexion_question_templates/prefilled_form.html.erb")
  end

  def save_edits
    @reflexion_question = ReflexionQuestion.where({ :id => params.fetch("id_to_modify") }).first

    @reflexion_question.question_id = params.fetch("question_id")
    @reflexion_question.reflexion_question = params.fetch("reflexion_question")

    if @reflexion_question.valid?
      @reflexion_question.save

      redirect_to("/reflexion_questions/" + @reflexion_question.id.to_s, { :notice => "Reflexion question updated successfully." })
    else
      render("reflexion_question_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @reflexion_question = ReflexionQuestion.where({ :id => params.fetch("id_to_remove") }).first
    @reflexion_question.destroy
    redirect_to("/reflexion_questions", { :notice => "Reflexion question deleted successfully." })
  end
  
  def add_rq_to_question
    
    @reflexion_question = ReflexionQuestion.new
    @reflexion_question.question_id = params.fetch("question_id")
    @reflexion_question.reflexion_question = params.fetch("new_reflection_question")
    @reflexion_question.user_id = params.fetch("user_id")

    if @reflexion_question.valid?
      @reflexion_question.save
      redirect_to("/existing_question_form/" + @reflexion_question.question_id.to_s, { :notice => "Reflexion question updated successfully." })
    else
      render("/add_reflection_question")
    end
    
  end
  
  
  def eliminate_reflection_question
    @reflexion_question = ReflexionQuestion.where({ :id => params.fetch("id") }).first
    question_id = @reflexion_question.question_id
    @reflexion_question.destroy
    redirect_to("/existing_question_form/"+question_id.to_s, { :notice => "Reflexion question deleted successfully." })
  end
  
  
end
