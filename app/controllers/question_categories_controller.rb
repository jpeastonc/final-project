class QuestionCategoriesController < ApplicationController
  def list
    @question_categories = QuestionCategory.all

    render("question_category_templates/list.html.erb")
  end

  def details
    @question_category = QuestionCategory.where({ :id => params.fetch("id_to_display") }).first

    render("question_category_templates/details.html.erb")
  end

  def blank_form
    @question_category = QuestionCategory.new

    render("question_category_templates/blank_form.html.erb")
  end

  def save_new_info
    @question_category = QuestionCategory.new

    @question_category.question_id = params.fetch("question_id")
    @question_category.category_id = params.fetch("category_id")

    if @question_category.valid?
      @question_category.save

      redirect_to("/question_categories", { :notice => "Question category created successfully." })
    else
      render("question_category_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @question_category = QuestionCategory.where({ :id => params.fetch("id_to_prefill") }).first

    render("question_category_templates/prefilled_form.html.erb")
  end

  def save_edits
    @question_category = QuestionCategory.where({ :id => params.fetch("id_to_modify") }).first

    @question_category.question_id = params.fetch("question_id")
    @question_category.category_id = params.fetch("category_id")

    if @question_category.valid?
      @question_category.save

      redirect_to("/question_categories/" + @question_category.id.to_s, { :notice => "Question category updated successfully." })
    else
      render("question_category_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @question_category = QuestionCategory.where({ :id => params.fetch("id_to_remove") }).first

    @question_category.destroy

    redirect_to("/question_categories", { :notice => "Question category deleted successfully." })
  end
end
