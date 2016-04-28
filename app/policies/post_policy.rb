class PostPolicy < ApplicationPolicy
  def destroy?
    user.admin? || record.user_id == user.id
  end
end
