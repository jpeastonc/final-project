class UserQuestionsController < ApplicationController
  def list
    @user_questions = UserQuestion.all

    render("user_question_templates/list.html.erb")
  end

  def details
    @user_question = UserQuestion.where({ :id => params.fetch("id_to_display") }).first

    render("user_question_templates/details.html.erb")
  end

  def blank_form
    @user_question = UserQuestion.new

    render("user_question_templates/blank_form.html.erb")
  end

  def save_new_info
    @user_question = UserQuestion.new

    @user_question.user_id = params.fetch("user_id")
    @user_question.question_id = params.fetch("question_id")

    if @user_question.valid?
      @user_question.save

      redirect_to("/user_questions", { :notice => "User question created successfully." })
    else
      render("user_question_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @user_question = UserQuestion.where({ :id => params.fetch("id_to_prefill") }).first

    render("user_question_templates/prefilled_form.html.erb")
  end

  def save_edits
    @user_question = UserQuestion.where({ :id => params.fetch("id_to_modify") }).first

    @user_question.user_id = params.fetch("user_id")
    @user_question.question_id = params.fetch("question_id")

    if @user_question.valid?
      @user_question.save

      redirect_to("/user_questions/" + @user_question.id.to_s, { :notice => "User question updated successfully." })
    else
      render("user_question_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @user_question = UserQuestion.where({ :id => params.fetch("id_to_remove") }).first

    @user_question.destroy

    redirect_to("/user_questions", { :notice => "User question deleted successfully." })
  end
end
