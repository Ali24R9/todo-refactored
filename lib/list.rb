class List

  @@all_lists = []
  def List.all
    @@all_lists
  end

  def List.create(title)
    new_list = List.new(title)
    new_list.save
    new_list
  end

  def save
    @@all_lists << self
  end

  def List.clear
    @@all_lists = []
  end

  def initialize(title)
    @title = title
    @tasks = []
  end

  def title
    @title
  end

  def add_task(task)
    @tasks << task
  end

  def tasks
    @tasks
  end

  def priority_sort
    @tasks.sort_by {|obj| obj.priority}.reverse
  end

  def due_date_sort
   @tasks.sort_by {|obj| obj.due_date}
  end
end
