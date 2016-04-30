class PostPolicy < ApplicationPolicy
  def destroy?
    user.admin? || record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
