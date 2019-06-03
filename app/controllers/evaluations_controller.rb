class EvaluationsController < ApplicationController
  def list
    @evaluations = Evaluation.all

    render("evaluation_templates/list.html.erb")
  end

  def details
    @evaluation = Evaluation.where({ :id => params.fetch("id_to_display") }).first

    render("evaluation_templates/details.html.erb")
  end

  def blank_form
    @evaluation = Evaluation.new

    render("evaluation_templates/blank_form.html.erb")
  end

  def save_new_info
    @evaluation = Evaluation.new

    @evaluation.rating = params.fetch("rating")
    @evaluation.comment = params.fetch("comment")
    @evaluation.user_question_id = params.fetch("user_question_id")

    if @evaluation.valid?
      @evaluation.save

      redirect_to("/evaluations", { :notice => "Evaluation created successfully." })
    else
      render("evaluation_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @evaluation = Evaluation.where({ :id => params.fetch("id_to_prefill") }).first

    render("evaluation_templates/prefilled_form.html.erb")
  end

  def save_edits
    @evaluation = Evaluation.where({ :id => params.fetch("id_to_modify") }).first

    @evaluation.rating = params.fetch("rating")
    @evaluation.comment = params.fetch("comment")
    @evaluation.user_question_id = params.fetch("user_question_id")

    if @evaluation.valid?
      @evaluation.save

      redirect_to("/evaluations/" + @evaluation.id.to_s, { :notice => "Evaluation updated successfully." })
    else
      render("evaluation_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @evaluation = Evaluation.where({ :id => params.fetch("id_to_remove") }).first

    @evaluation.destroy

    redirect_to("/evaluations", { :notice => "Evaluation deleted successfully." })
  end
end
