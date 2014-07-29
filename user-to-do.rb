require "./lib/tasks"
require './lib/lists'

@list_cat = []
@list = []

def main_menu
  loop do
    puts "Press 'q' to add a category or 'p' to list your categories"
    # puts "Press 'a' to add a task or 'l' to list your tasks."
    # puts "Press 'c' to change the status of your tasks."
    if @list_cat.length > 0
      puts "Press 'n' choose a category and add tasks to it"
      puts "Press 's' to show all categories and tasks"
    end
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'q'
      add_categories
    elsif main_choice == 'p'
      list_categories
    elsif main_choice == 's'
      show_all
    elsif main_choice == 'n'
      pick_category
    # elsif main_choice == 'a'
    #   add_tasks
    # elsif main_choice == 'l'
    #   list_tasks
    # elsif main_choice == 'c'
    #   change_status
    elsif main_choice == 'x'
      puts "Goodbye"
      exit
    else
      puts "Sorry, that wasn't a valid option."
    end
  end
end

def pick_category
  puts "Choose a category:"
  category_chosen = gets.chomp
  @list_cat.each do |cat|
    if cat.category == category_chosen
      puts "Press 'h' to add a new task to #{cat.category}, 'y' to quit"
      choice = gets.chomp
        if choice == 'h'
          puts "Enter a new task"
          new_task = gets.chomp
          cat.add_task(Task.new(new_task))
        else
          main_menu
        end
    end
  end
end

def show_all
  @list_cat.each do |cat|
    puts cat.category
    cat.tasks.each do |task|
      puts "- #{task.description} | #{task.status}"
    end
  end
  puts "Have you completed any of these tasks? Press 'm' if yes, press 'k' if not."
  choice = gets.chomp
    if choice == 'm'
      puts "Which task did you complete?"
      task_input = gets.chomp
      @list_cat.each do |cat_stat|
        cat_stat.tasks.each do |task_stat|
          if task_input == task_stat.description
            task_stat.set_status("C")
          end
        end
      end
    else
      main_menu
    end
end

def add_categories
  puts "Enter a new category:"
  user_category = gets.chomp
  @list_cat << List.new(user_category)
  puts "Category Added.\n\n"
end

def list_categories
  puts "Here is a list of all your categories"
  @list_cat.each do |list|
    puts list.category
  end
end

# def add_tasks
#   puts "Enter a new task:"
#   user_description = gets.chomp
#   @tasks << Task.new(user_description)
#   puts "Task added.\n\n"
# end

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
