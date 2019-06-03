class UserTypesController < ApplicationController
  def list
    @user_types = UserType.all

    render("user_type_templates/list.html.erb")
  end

  def details
    @user_type = UserType.where({ :id => params.fetch("id_to_display") }).first

    render("user_type_templates/details.html.erb")
  end

  def blank_form
    @user_type = UserType.new

    render("user_type_templates/blank_form.html.erb")
  end

  def save_new_info
    @user_type = UserType.new

    @user_type.name = params.fetch("name")

    if @user_type.valid?
      @user_type.save

      redirect_to("/user_types", { :notice => "User type created successfully." })
    else
      render("user_type_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @user_type = UserType.where({ :id => params.fetch("id_to_prefill") }).first

    render("user_type_templates/prefilled_form.html.erb")
  end

  def save_edits
    @user_type = UserType.where({ :id => params.fetch("id_to_modify") }).first

    @user_type.name = params.fetch("name")

    if @user_type.valid?
      @user_type.save

      redirect_to("/user_types/" + @user_type.id.to_s, { :notice => "User type updated successfully." })
    else
      render("user_type_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @user_type = UserType.where({ :id => params.fetch("id_to_remove") }).first

    @user_type.destroy

    redirect_to("/user_types", { :notice => "User type deleted successfully." })
  end
end
