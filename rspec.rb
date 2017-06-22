require 'rspec'
require_relative 'tasklist'
# Story: As a developer, I can create a Task.
#
describe Task do
  it "has to be real" do
    expect{Task.new}.to_not raise_error
  end
end
# Story: As a developer, I can give a Task a title and retrieve it.
#
describe Task do
  it "has to list a title and retrieve it" do
    a = Task.new
    expect(a.enter_task("asdf")).to eq("asdf")
    expect(a.task_retrieve).to eq("asdf")
  end
end
# Story: As a developer, I can give a Task a description and retrieve it.
#
describe Task do
  it "title has a description and retrieve it" do
    b = Task.new
    expect(b.enter_description("asdf")).to eq("asdf")
    expect(b.description_retrieve).to eq("asdf")
  end
end

# Story: As a developer, I can mark a Task done.
#
describe Task do
  it "task should show if complete or not" do

    expect(Task.new.task_status).to eq("Task incomplete")
    expect(Task.new.task_toggle).to eq("Task completed")
  end
end
# Story: As a developer, when I print a Task that is done, its status is shown.
# Hint: Implement to_s have it return the features of a Task with labels (for instance, "Title: Buy Food Description: Bananas, milk").
#
describe Task do
  it "task should show if complete or not" do

    expect(Task.new.task_status).to eq("Task incomplete")
    expect(Task.new.task_toggle).to eq("Task completed")
  end
end

# Story: As a developer, I can add all of my Tasks to a TaskList.
# Hint: A TaskList has-many Tasks
#
describe Tasklist do
  it "should update array" do
    a = Tasklist.new
    task1 = Task.new
    expect{a.add_task(task1)}.to change{a.list_task}
  end
end
# Story: As a developer with a TaskList, I can get the completed items.
#
# describe Tasklist do
#   it "should update array" do
#     a = Tasklist.new
#     task1 = Task.new.task_toggle
#     task2 = Task.new
#     a.add_task(task1)
#     a.add_task(task2)
#     a.update_complete
#     expect(a.show_complete).not_to be_empty
#   end
# end
# Story: As a developer with a TaskList, I can get the incomplete items.

######################################################
# Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
# Hint: Use the built-in Ruby Date class
#
describe DueDateTask do
  it "has to be real" do
    expect{DueDateTask.new("asdf")}.to_not raise_error
  end
end
# Story: As a developer, I can print an item with a due date with labels and values.
# Hint: When implementing to_s, use super to call to_s on the super class.
#
describe DueDateTask do
  it "should return date" do
    z = DueDateTask.new("asdf")
    expect(z.read_info).to be_a(String)
  end
end


# Story: As a developer, I can add items with due dates to my TaskList.
# Hint: Consider keeping items with due dates separate from the other items.
#
# Story: As a developer with a TaskList, I can list all the not completed items that are due today.
#
# Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
#
# Story: As a developer with a TaskList with and without due dates, I can list all the not completed items in order of due date, and then the items without due dates.
