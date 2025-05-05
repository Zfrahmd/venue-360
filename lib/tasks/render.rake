namespace :render do
  desc 'Commands that run on Render deploys'
  task :deploy do
    if ENV['RENDER'] # Only run in Render environment
      puts 'Running database migrations...'
      Rake::Task['db:migrate'].invoke
      
      puts 'Seeding admin user...'
      user = User.find_or_initialize_by(role: "admin", email: 'admin@gmail.com')
      
      user.assign_attributes(first_name: "super",
      last_name: "admin", 
      password: ENV['ADMIN_PASSWORD'], 
      password_confirmation: ENV['ADMIN_PASSWORD'])

      user.save
      puts 'Admin User Seeded!'
    end
  end
end