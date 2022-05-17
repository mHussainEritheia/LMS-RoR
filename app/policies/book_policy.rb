class BookPolicy
  attr_reader :user, :record
  def initialize(user, record)
    @user = user
    @record = record
  end
  def index?
    readerCheck?
  end
  def show?
    readerCheck?
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
    readerCheck?
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
  private
  def readerCheck?
    user.role.name === READER
  end
end  