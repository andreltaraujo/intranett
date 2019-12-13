class TaskPolicy < ApplicationPolicy
  
  def index?
    @user.manager?
  end
  
  def new?
  end 
  
  
  class Scope < Scope
    def resolve
      if user.manager?  
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
