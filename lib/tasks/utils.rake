namespace :db do
  desc 'Creates an AdminUser with an email and password'
  task :admin_user, %i[email password] => :environment do |_, args|
    u = AdminUser.where('email = ?', args[:email])

    if u.present?
      puts "The admin user with the email #{args[:email]} already exists."
    else
      AdminUser.create!(
        email: args[:email],
        password: args[:password]
      )
      puts "The admin user with the email #{args[:email]} is created."
    end
  end
end
