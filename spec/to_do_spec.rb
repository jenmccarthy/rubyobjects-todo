require 'rspec'
require 'tasks'
require 'lists'

describe Task do
  it "will take in a description of a task" do
    test_task = Task.new("Walk the dog")
    test_task.should be_an_instance_of Task
  end

  it 'returns the description' do
      test_task = Task.new("Walk the dog")
      test_task.description.should eq "Walk the dog"
  end

  it 'returns the status with a default value of I' do
      test_task = Task.new("Walk the dog")
      test_task.status.should eq "I"
  end

  it 'will change the status of a completed task' do
    test_task = Task.new("Walk the dog")
    test_task.set_status("C")
    test_task.status.should eq "C"
  end

end

describe List do
  it 'will take in a category of a list' do
    test_list = List.new("Home")
    test_list.should be_an_instance_of List
  end

  it 'returns the list category' do
    test_list = List.new("Home")
    test_list.category.should eq "Home"
  end
end
