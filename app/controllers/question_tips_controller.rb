class QuestionTipsController < ApplicationController
  def list
    @question_tips = QuestionTip.all

    render("question_tip_templates/list.html.erb")
  end

  def details
    @question_tip = QuestionTip.where({ :id => params.fetch("id_to_display") }).first

    render("question_tip_templates/details.html.erb")
  end

  def blank_form
    @question_tip = QuestionTip.new

    render("question_tip_templates/blank_form.html.erb")
  end

  def save_new_info
    @question_tip = QuestionTip.new

    @question_tip.question_id = params.fetch("question_id")
    @question_tip.content = params.fetch("content")

    if @question_tip.valid?
      @question_tip.save

      redirect_to("/question_tips", { :notice => "Question tip created successfully." })
    else
      render("question_tip_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @question_tip = QuestionTip.where({ :id => params.fetch("id_to_prefill") }).first

    render("question_tip_templates/prefilled_form.html.erb")
  end

  def save_edits
    @question_tip = QuestionTip.where({ :id => params.fetch("id_to_modify") }).first

    @question_tip.question_id = params.fetch("question_id")
    @question_tip.content = params.fetch("content")

    if @question_tip.valid?
      @question_tip.save

      redirect_to("/question_tips/" + @question_tip.id.to_s, { :notice => "Question tip updated successfully." })
    else
      render("question_tip_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @question_tip = QuestionTip.where({ :id => params.fetch("id_to_remove") }).first

    @question_tip.destroy

    redirect_to("/question_tips", { :notice => "Question tip deleted successfully." })
  end
end
