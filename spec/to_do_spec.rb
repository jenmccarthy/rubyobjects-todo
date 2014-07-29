require 'rspec'
require 'tasks'

describe Task do
  it "will take in a description of a task" do
    test_task = Task.new("Walk the dog")
    test_task.should_be_an_instance_of Task
  end
end
