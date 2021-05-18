class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope # Class you handle (Restaurant)
    def resolve
      scope.where(user: user) # Restaurant.all
    end
  end

  def show? # returns a boolean
    true
  end
  
  def new?
    show?
  end

  def create?
    show?
  end

  def edit?
    # I can edit only if I am the owner or if i am admin
    record.user == user || user.admin # true / false
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
