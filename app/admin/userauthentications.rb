ActiveAdmin.register Userauthentication do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_sent_at, :remember_created_at, :user_banned, :password, :password_confirmation
  #
  # or
  #
  filter :email , as: :select

  form do |f|
    f.inputs "Userauthentication" do
      f.input :email
      f.input :password if f.object.new_record?
      f.input :password_confirmation if f.object.new_record?
      f.input :user_banned
    end
    f.actions
  end
   # permit_params do
   #  permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
   #  permitted << :other if params[:action] == 'create' && current_user.admin?
   #  permitted
   # end

end
