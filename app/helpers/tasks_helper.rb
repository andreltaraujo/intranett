module TasksHelper
  
  def statuses_options
    @statuses = Task.statuses
  end
end