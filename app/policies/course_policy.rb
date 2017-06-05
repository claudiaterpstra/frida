class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.courses.count > 0
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
