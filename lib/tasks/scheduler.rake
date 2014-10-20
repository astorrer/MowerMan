desc "This task assigns the daily tasks"
task :assign_daily_workload => :environment do
  puts "Assigning the daily tasks..."
  Plantask.assign_daily_workload
  puts "done."
end

desc "This task assigns the weekly tasks"
task :assign_weekly_workload => :environment do
  puts "Assigning the weekly tasks..."
  Plantask.assign_weekly_workload
  puts "done."
end

desc "This task assigns the monthly tasks"
task :assign_monthly_workload => :environment do
  puts "Assigning the monthly tasks..."
  Plantask.connection.assign_monthly_workload
  puts "done."
end

desc "This task assigns the yearly tasks"
task :assign_yearly_workload => :environment do
  puts "Assign the yearly tasks..."
  Plantask.assign_yearly_workload
  puts "done."
end