class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.teacher == true
  end

  def update?
    record.user == user
  end

  def publish?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
