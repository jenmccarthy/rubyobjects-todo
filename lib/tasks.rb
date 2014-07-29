class Task
  def initialize(description)
    @description = description
    @status = "I"
  end
  def status
    @status
  end
  def description
    @description
  end
  def set_status(status)
    @status = status
  end
end
