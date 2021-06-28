ActiveAdmin.register Likesection do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :articlesection_id, :users_liked
  #
  # or
  #
  filter :articlesection_id , as: :select
   # permit_params do
   #   permitted = [:articlesection_id, :users_liked]
   #   permitted << :other if params[:action] == 'create' && current_user.admin?
   #   permitted
   # end

end
