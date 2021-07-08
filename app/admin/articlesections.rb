ActiveAdmin.register Articlesection do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :userauthentication_id, :article_topic, :article_content, :likes_count, :category
  #
  # or
  #
  filter :userauthentication_id, as: :select
  filter :categorysection_id, as: :select
  filter :article_topic, as: :select

   # permit_params do
   #   permitted = [:userauthentication_id, :article_topic, :article_content, :likes_count, :category]
   #   permitted << :other if params[:action] == 'create' && current_user.admin?
   #   permitted
   # end
   index do
     selectable_column
     id_column
     column :userauthentication_id
     column :article_topic
     column :article_content
     column :likes_count
     column :category
     actions
   end

   form do |f|
     f.inputs "Commentsection" do
       f.input :userauthentication_id
       f.input :article_topic
       f.input :article_content
       f.input :likes_count
       f.input :categorysection_id
     end
     f.actions
   end
end
