require 'rspec'
require 'task'
require 'list'

describe Task do

  before do
    Task.clear
  end

  it 'should initialize the Task with a description' do
    new_task = Task.new('wash the car', '02/23/12', '1')
    new_task.should be_an_instance_of Task
  end

  it 'lets you read the description' do
    new_task = Task.new('wash the car','02/23/12', '1')
    new_task.description.should eq 'wash the car'
  end

  it 'lets you complete a task' do
    new_task = Task.new('walk the dog', '02/23/12', '1')
    new_task.completed.should eq true
  end

  it 'adds a due task to the task' do
    new_task = Task.new('walk the dog', '02/23/12', '1')
    new_task.due_date.should eq '02/23/12'
  end

  it 'adds a due task to the task' do
    new_task = Task.new('walk the dog', '02/23/12', '1')
    new_task.priority.should eq '1'
  end

  describe '.all' do
    it 'is empty at first' do
      Task.all.should eq []
    end
  end

  describe '.clear' do
     it 'empties out all of the saved tasks' do
       Task.new('wash the lion', '02/02/02', '5').save
       Task.clear
       Task.all.should eq []
     end
   end

  describe '.create' do
    it 'makes a new instance of Task' do
      test_task = Task.create('wash the lion', '02/02/02', '5')
      test_task.should be_an_instance_of Task
    end

    it 'saves the Task' do
      test_task = Task.create('wash the lion', '02/02/02', '5')
      Task.all.should eq [test_task]
    end
  end

  describe '#save' do
    it 'adds a task to the array of saved tasks' do
      test_task = Task.new('wash the lion', '02/02/02', '5')
      test_task.save
      Task.all.should eq [test_task]
    end
  end
end


describe List do

  before do
    List.clear
  end

  it 'should initialize with a list title' do
    new_list = List.new('Chores')
    new_list.should be_an_instance_of List
  end

  it 'should add a task to the instance list' do
    new_list = List.new('Chores')
    new_task = Task.new('wash the car', '02/23/12', '1')
    new_list.add_task(new_task)
    new_list.tasks.should eq [new_task]
  end

  it 'should sort the instances by priority' do
    new_list = List.new('Chores')
    new_task2 = Task.new('wash the car', '02/23/12', '4')
    new_task1 = Task.new('walk the dog', '02/23/12', '1')
    new_task3 = Task.new('walk the dog', '02/23/12', '3')
    new_list.add_task(new_task1)
    new_list.add_task(new_task2)
    new_list.add_task(new_task3)
    new_list.priority_sort.should eq [new_task2, new_task3, new_task1]
  end

  it 'should sort the instances by due date' do
    new_list = List.new('Chores')
    new_task1 = Task.new('wash the car', '02/12/14', '4')
    new_task2 = Task.new('walk the dog', '02/23/14', '1')
    new_task3 = Task.new('grocery store', '02/03/14', '3')
    new_list.add_task(new_task1)
    new_list.add_task(new_task2)
    new_list.add_task(new_task3)
    new_list.due_date_sort.should eq [new_task3, new_task1, new_task2]
  end

  describe '.all' do
    it 'is empty at first' do
      List.all.should eq []
    end
  end

  describe '.clear' do
     it 'empties out all of the saved list' do
       new_list = List.new('chores')
       new_list.save
       List.clear
       List.all.should eq []
     end
   end

  describe '.create' do
    it 'makes a new instance of List' do
      test_list = List.create('chores')
      test_list.should be_an_instance_of List
    end

    it 'saves the List' do
      test_list = List.create('title')
      List.all.should eq [test_list]
    end
  end

  describe '#save' do
    it 'adds a list to the array of saved lists' do
      test_list = List.new('chores')
      test_list.save
      List.all.should eq [test_list]
    end
  end
end
