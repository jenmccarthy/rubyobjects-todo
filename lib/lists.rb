class List
  def initialize(category)
    @tasks = []
    @category = category
  end
  def category
    @category
  end
  def tasks
   @tasks
  end
  def add_task(task)
    self.tasks<<task
  end
end

