class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def artistdashboard?
    user.courses.count > 0
  end
end
