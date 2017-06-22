class Tasklist
  def initialize
    @arr = []
    @arr_incomplete = []
    @arr_complete = []
  end

  def list_task
    @arr
  end

  def add_task(v)
    @arr = @arr.push(v)
  end

  def update_complete
    # @arr_complete = @arr
    @arr_complete = @arr.reject {|x| x.task_status == "Task incomplete"}

    # @arr_complete = @arr
    # @arr_complete.delete_if {|x| x.task_status == "Task incomplete"}
    # @arr_incompete= @arr.all.partition { |t| t.incomplete? }
    # @arr_complete = Task.select {|a| if a.status == "Task completed" @arr_complete = a}
      # e[:task_status].include? "Task completed"

  end


  def show_complete
    @arr_complete
  end

  def update_incomplete
    # @arr_incomplete.delete_if {|x| x.task_status == "Task completed"}
    @arr_incomplete = @arr.reject {|x| x.task_status == "Task completed"}
  end

  def show_incomplete
    @arr_incomplete
  end
end

class Task
   def initialize
     @task_status = "Task incomplete"
   end

  def enter_task (task)
    @task = task
  end

  def task_retrieve
    @task
  end

  def enter_description (description)
    @description = description
  end

  def description_retrieve
    @description
  end

  def task_toggle
    if task_status == "Task incomplete"
      @task_status = "Task completed"
    elsif task_status == "Task completed"
      @task_status= "Task incomplete"
    end
  end

  def task_status
    @task_status
  end
end

class DueDateTask<Task

  def initialize (date)
    @date = date
    @info = "The due date for this file is #{@date}"
  end

  def print_info
    puts @info
  end

  def read_info
    @info
  end

  def add_task(v)
    @arr = @arr.push(v)
  end



end
