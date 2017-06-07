class FeedbackPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      true
    end

  end
end
