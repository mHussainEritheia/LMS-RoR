# frozen_string_literal: true

class Reader::BookPolicy < ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
        user.role_id === 2
        # debugger
    end
  
    def show?
      @user.role_id === 2
    end
  
    def create?
      user.role_id === 2
    end
  
    def new?
      user.role_id === 2
    end
  
    def update?
      user.role_id === 2
    end
  
    def edit?
      user.role_id === 2
    end
  
    def destroy?
      user.role_id === 2
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
  end
  