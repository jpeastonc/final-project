Rails.application.routes.draw do
  match("/", { :controller => "navigator", :action => "home", :via => "get" })
  match("/home", { :controller => "navigator", :action => "home", :via => "get" })
  match("/full_mock/:interview_type", { :controller => "navigator", :action => "full_mock", :via => "get" })
  match("/save_user_question", { :controller => "navigator", :action => "save_user_question", :via => "post" })
  
  match("/question_history", { :controller => "navigator", :action => "question_history", :via => "get" })
  match("/practice_interview_questions", { :controller => "navigator", :action => "practice_interview_questions", :via => "get" })
  match("/run_practice_question", { :controller => "navigator", :action => "run_practice_question", :via => "post" })

  
  match("/add_reflection_question", { :controller => "reflexion_questions", :action => "add_rq_to_question", :via => "post" })
  match("/eliminate_reflection_question/:id", { :controller => "reflexion_questions", :action => "eliminate_reflection_question", :via => "get" })


  
  
  match("/add_tip_to_question", { :controller => "question_tips", :action => "add_tip_to_question", :via => "post" })
  match("/eliminate_tip/:id", { :controller => "question_tips", :action => "eliminate_tip", :via => "get" })

  
  # Routes for the User question resource:

  # CREATE
  match("/new_user_question_form", { :controller => "user_questions", :action => "blank_form", :via => "get" })
  match("/insert_user_question_record", { :controller => "user_questions", :action => "save_new_info", :via => "post" })

  # READ
  match("/user_questions", { :controller => "user_questions", :action => "list", :via => "get" })
  match("/user_questions/:id_to_display", { :controller => "user_questions", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_user_question_form/:id_to_prefill", { :controller => "user_questions", :action => "prefilled_form", :via => "get" })
  match("/update_user_question_record/:id_to_modify", { :controller => "user_questions", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_user_question/:id_to_remove", { :controller => "user_questions", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the User type resource:

  # CREATE
  match("/new_user_type_form", { :controller => "user_types", :action => "blank_form", :via => "get" })
  match("/insert_user_type_record", { :controller => "user_types", :action => "save_new_info", :via => "post" })

  # READ
  match("/user_types", { :controller => "user_types", :action => "list", :via => "get" })
  match("/user_types/:id_to_display", { :controller => "user_types", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_user_type_form/:id_to_prefill", { :controller => "user_types", :action => "prefilled_form", :via => "get" })
  match("/update_user_type_record/:id_to_modify", { :controller => "user_types", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_user_type/:id_to_remove", { :controller => "user_types", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Reflexion question resource:

  # CREATE
  match("/new_reflexion_question_form", { :controller => "reflexion_questions", :action => "blank_form", :via => "get" })
  match("/insert_reflexion_question_record", { :controller => "reflexion_questions", :action => "save_new_info", :via => "post" })

  # READ
  match("/reflexion_questions", { :controller => "reflexion_questions", :action => "list", :via => "get" })
  match("/reflexion_questions/:id_to_display", { :controller => "reflexion_questions", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_reflexion_question_form/:id_to_prefill", { :controller => "reflexion_questions", :action => "prefilled_form", :via => "get" })
  match("/update_reflexion_question_record/:id_to_modify", { :controller => "reflexion_questions", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_reflexion_question/:id_to_remove", { :controller => "reflexion_questions", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :users
  # Routes for the Question tip resource:

  # CREATE
  match("/new_question_tip_form", { :controller => "question_tips", :action => "blank_form", :via => "get" })
  match("/insert_question_tip_record", { :controller => "question_tips", :action => "save_new_info", :via => "post" })

  # READ
  match("/question_tips", { :controller => "question_tips", :action => "list", :via => "get" })
  match("/question_tips/:id_to_display", { :controller => "question_tips", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_question_tip_form/:id_to_prefill", { :controller => "question_tips", :action => "prefilled_form", :via => "get" })
  match("/update_question_tip_record/:id_to_modify", { :controller => "question_tips", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_question_tip/:id_to_remove", { :controller => "question_tips", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Evaluation resource:

  # CREATE
  match("/new_evaluation_form", { :controller => "evaluations", :action => "blank_form", :via => "get" })
  match("/insert_evaluation_record", { :controller => "evaluations", :action => "save_new_info", :via => "post" })

  # READ
  match("/evaluations", { :controller => "evaluations", :action => "list", :via => "get" })
  match("/evaluations/:id_to_display", { :controller => "evaluations", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_evaluation_form/:id_to_prefill", { :controller => "evaluations", :action => "prefilled_form", :via => "get" })
  match("/update_evaluation_record/:id_to_modify", { :controller => "evaluations", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_evaluation/:id_to_remove", { :controller => "evaluations", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Question category resource:

  # CREATE
  match("/new_question_category_form", { :controller => "question_categories", :action => "blank_form", :via => "get" })
  match("/insert_question_category_record", { :controller => "question_categories", :action => "save_new_info", :via => "post" })

  # READ
  match("/question_categories", { :controller => "question_categories", :action => "list", :via => "get" })
  match("/question_categories/:id_to_display", { :controller => "question_categories", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_question_category_form/:id_to_prefill", { :controller => "question_categories", :action => "prefilled_form", :via => "get" })
  match("/update_question_category_record/:id_to_modify", { :controller => "question_categories", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_question_category/:id_to_remove", { :controller => "question_categories", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  match("/new_category_form", { :controller => "categories", :action => "blank_form", :via => "get" })
  match("/insert_category_record", { :controller => "categories", :action => "save_new_info", :via => "post" })

  # READ
  match("/categories", { :controller => "categories", :action => "list", :via => "get" })
  match("/categories/:id_to_display", { :controller => "categories", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_category_form/:id_to_prefill", { :controller => "categories", :action => "prefilled_form", :via => "get" })
  match("/update_category_record/:id_to_modify", { :controller => "categories", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_category/:id_to_remove", { :controller => "categories", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Question resource:

  # CREATE
  match("/new_question_form", { :controller => "questions", :action => "blank_form", :via => "get" })
  match("/insert_question_record", { :controller => "questions", :action => "save_new_info", :via => "post" })

  # READ
  match("/questions", { :controller => "questions", :action => "list", :via => "get" })
  match("/questions/:id_to_display", { :controller => "questions", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_question_form/:id_to_prefill", { :controller => "questions", :action => "prefilled_form", :via => "get" })
  match("/update_question_record/:id_to_modify", { :controller => "questions", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_question/:id_to_remove", { :controller => "questions", :action => "remove_row", :via => "get" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
