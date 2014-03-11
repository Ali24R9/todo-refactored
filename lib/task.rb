class Task

  @@all_tasks = []

  def Task.all
    @@all_tasks
  end

  def Task.clear
    @@all_tasks = []
  end

  def Task.create(description, due_date, priority)
    new_task = Task.new(description, due_date, priority)
    new_task.save
    new_task
  end

  def save
    @@all_tasks << self
  end

  def initialize(description, due_date, priority)
    @description = description
    @due_date = due_date
    @priority = priority
  end

  def description
    @description
  end

  def completed
    @completed = true
  end

  def due_date
    @due_date
  end

  def priority
    @priority
  end

end

