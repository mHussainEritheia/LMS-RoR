class Admin::BookPolicy < ApplicationPolicy
  attr_reader :user, :record
  def initialize(user, record)
    @user = user
    @record = record
  end
  def index?
    adminCheck?
  end
  def create?
    adminCheck?
  end
  def new?
    adminCheck?
  end
  def update?
    adminCheck?
  end
  def edit?
    adminCheck?
  end
  def destroy?
    adminCheck?
  end
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end
    private
    attr_reader :user, :scope
  end
  private
  def adminCheck?
    user.role.name === ADMIN
  end
end