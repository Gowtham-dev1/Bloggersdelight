ActiveAdmin.register Activitysection do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :userauthentication_id,:activity,:articlesection_id
  #
  # or
  #
  filter :userauthentication_id , as: :select
  filter :articlesection_id , as: :select
 #  permit_params do
 #   permitted = [:userauthentication_id,:activity,:articlesection_id]
 #   permitted << :other if params[:action] == 'create' && current_user.admin?
 #   permitted
 # end
 form do |f|
   f.inputs "Commentsection" do
     f.input :userauthentication_id
     f.input :articlesection_id
     f.input :activity
   end
   f.actions
 end

end
