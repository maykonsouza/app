class HostPolicy < ApplicationPolicy

  def list?
    user.admin?
  end

  def show?
    user.admin?
  end

  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end



  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
