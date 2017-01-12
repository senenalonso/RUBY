require 'pry'
require_relative 'Task'

class TodoList
    attr_reader :tasks
    def initialize(name)
    	@owner = name
      @tasks = []
    end

    def add_task(task)
    	@tasks.push(task)
    	task.id
    end

    def delete_task(id)
    	@tasks.delete_if {|task| task.id==id}
    end

    def find_task_by_id(id)
    	@tasks.bsearch {|task| task.id == id}
    end

    def sort_by_created(asc=true)
    	if asc
    		sorted_tasks = @tasks.sort { | task1, task2 | task1.created_at <=> task2.created_at }
    	else	
    		sorted_tasks = @tasks.sort { | task1, task2 | task2.created_at <=> task1.created_at }
    	end
    	
    end
end