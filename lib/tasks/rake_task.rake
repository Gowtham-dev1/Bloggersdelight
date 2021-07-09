desc "Populating a column in Userauthentication"

task :populate_column => :environment do
  users=Userauthentication.all
  users.update_all({user_banned:false})
  # users.where(id:19).update_all(user_banned:true)
end
