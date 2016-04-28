class PostPolicy < ApplicationPolicy
  def destroy?
    user.admin? || record.User == user
  end
end
