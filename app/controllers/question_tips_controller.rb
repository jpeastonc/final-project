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
  
  def add_tip_to_question
    @tip = QuestionTip.new
    @tip.question_id = params.fetch("question_id")
    @tip.content = params.fetch("new_tip")
    @tip.user_id = params.fetch("user_id")

    if @tip.valid?
      @tip.save
      redirect_to("/existing_question_form/" + @tip.question_id.to_s, { :notice => "Tip added successfully." })
    else
      render("/add_tip_to_question")
    end
    
  end
  
  def eliminate_tip
    @tip = QuestionTip.where({ :id => params.fetch("id") }).first
    question_id = @tip.question_id
    @tip.destroy
    redirect_to("/existing_question_form/"+question_id.to_s, { :notice => "Reflexion question deleted successfully." })
  end
  
  
end
