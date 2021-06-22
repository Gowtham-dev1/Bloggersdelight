ActiveAdmin.register Articlesection do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :userauthentication_id, :article_topic, :article_content, :likes_count
  #
  # or
  #
  filter :userauthentication_id , as: :select
  filter :article_topic, as: :select

   permit_params do
     permitted = [:userauthentication_id, :article_topic, :article_content, :likes_count]
     permitted << :other if params[:action] == 'create' && current_user.admin?
     permitted
   end


end
