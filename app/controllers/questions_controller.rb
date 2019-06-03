class QuestionsController < ApplicationController
  def list
    @questions = Question.all

    render("question_templates/list.html.erb")
  end

  def details
    @question = Question.where({ :id => params.fetch("id_to_display") }).first

    render("question_templates/details.html.erb")
  end

  def blank_form
    @question = Question.new

    render("question_templates/blank_form.html.erb")
  end

  def save_new_info
    @question = Question.new

    @question.question = params.fetch("question")
    @question.user_id = params.fetch("user_id")

    if @question.valid?
      @question.save
      categories = params.fetch("categories")
      categories.each do |category_id|
        qc=QuestionCategory.new
        qc.category_id=category_id
        qc.question_id=@question.id
        qc.save
      end

      redirect_to("/questions", { :notice => "Question created successfully." })
    else
      render("question_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @question = Question.where({ :id => params.fetch("id_to_prefill") }).first

    render("question_templates/prefilled_form.html.erb")
  end

  def save_edits
    @question = Question.where({ :id => params.fetch("id_to_modify") }).first

    @question.question = params.fetch("question")

    if @question.valid?
      @question.save

      redirect_to("/questions/" + @question.id.to_s, { :notice => "Question updated successfully." })
    else
      render("question_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @question = Question.where({ :id => params.fetch("id_to_remove") }).first

    @question.destroy

    redirect_to("/questions", { :notice => "Question deleted successfully." })
  end
end
