ActiveAdmin.register Commentsection do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :userauthentication_id, :articlesection_id, :comment
  #
  # or
  #
  filter :userauthentication_id , as: :select
   # permit_params do
   #   permitted = [:userauthentication_id, :articlesection_id, :comment]
   #   permitted << :other if params[:action] == 'create' && current_user.admin?
   #   permitted
   # end

   index do
     selectable_column
     id_column
     column :userauthentication_id
     column :articlesection_id
     column :comment
     actions
   end
   form do |f|
     f.inputs "Commentsection" do
       f.input :articlesection_id
       f.input :userauthentication_id
       f.input :comment
     end
     f.actions
   end

end
