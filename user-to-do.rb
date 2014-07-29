require "./lib/tasks"

@list = []

def main_menu
  loop do
    puts "Press 'a' to add a task or 'l' to list your tasks."
    puts "Press 'c' to change the status of your tasks."
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_tasks
    elsif main_choice == 'l'
      list_tasks
    elsif main_choice == 'c'
      change_status
    elsif main_choice == 'x'
      puts "Goodbye"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def add_tasks
  puts "Enter a a new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  @list.each do |task|
    puts "#{task.description} | #{task.status}"
  end
  puts "\n"
end

def change_status
  puts "Change the status to 'c' for complete, or enter to move on"
  @list.each do |task|
  puts "Here's your task #{task.description}, with a current status of #{task.status}"
    task.set_status(gets.chomp)
  end
  puts "\n"
end

main_menu
