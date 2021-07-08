desc "Creating a new column in Userauthentication"

task :populate_column => :environment do
  users=Userauthentication.all
  users.each do |user|
    user.update(user_banned:false)
    puts "#{user.user_banned}"
  end
end
