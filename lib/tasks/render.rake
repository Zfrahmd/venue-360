namespace :render do
  desc 'Commands that run on Render deploys'
  task :deploy do
    if ENV['RENDER'] # Only run in Render environment
      puts 'Running database migrations...'
      Rake::Task['db:migrate'].invoke
      
      puts 'Seeding admin user...'
      User.find_or_create_by(
        first_name: "super",
        last_name: "admin",
        role: "admin",
        email: 'admin@gmail.com',
        password: ENV['ADMIN_PASSWORD'],
        password_confirmation: ENV['ADMIN_PASSWORD'],
      )
      puts 'Admin User Seeded!'
    end
  end
end