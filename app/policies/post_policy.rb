class PostPolicy < ApplicationPolicy
  def destroy?
    user.admin? || record.user_id == user.id
  end

  def permitted_attributes
    if user.admin?
      [:title, :body, :special]
    else
      [:title, :body]
    end
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
