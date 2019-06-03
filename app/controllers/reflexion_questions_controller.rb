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
end
