# frozen_string_literal: true

class Reader::BookPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
        @user.role_id === 2
        debugger
    end
  
    def show?
      @user.role_id === 2
    end
  
    def create?
      false
    end
  
    def new?
      false
    end
  
    def update?
      false
    end
  
    def edit?
      false
    end
  
    def destroy?
      false
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
  