require 'date'

class Tasklist
  def initialize
    @arr = []
    @arr_incomplete = []
    @arr_complete = []
    @arr_do_today = []
    @arr_sort_incomplete = []
    @current_time = DateTime.now
    @current_time = @current_time.strftime "%m/%d/%Y"
    @arr_sort_all_incomplete =  []
    @arr_incompletes_without_date = []
  end

  def list_task
    @arr
  end

  def add_task(v)
    @arr = @arr.push(v)
  end

  def update_complete
    @arr_complete = @arr.reject {|x| x.task_status == "Task incomplete"}
  end

  def due_today
    @arr_do_today = @arr_incomplete.reject {|x| x.read_date != @current_time}
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

  def update_incompletes_with_date
  @arr_sort_incomplete = @arr_incomplete.reject {|x| x.read_date == nil}
  end

  def sort_incompletes_by_date
    @arr_sort_incomplete.sort_by { |k| k.read_date}
  end

  # def update_incomplete_without_date
  # end

  def sort_incompletes
    @arr_incompletes_without_date = @arr_incomplete.reject {|x| x.read_date != nil}
    @arr_sort_all_incomplete = @arr_sort_incomplete.sort_by { |k| k.read_date}
    @arr_sort_all_incomplete + @arr_incompletes_without_date
  end
  def list_all_incompletes
    @arr_sort_all_incomplete
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

   def due_date (date)
     @date = Date.parse(date).strftime "%m/%d/%Y"
    #  @info = "The due date for this file is #{@date}"
   end

   def print_info
     puts @info
   end

   def read_date
     @date
   end
end
