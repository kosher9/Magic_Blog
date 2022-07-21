class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Comment], public: true
    return unless user.present?
    can :destroy, [Post, Comment]
    return unless user.role?
    can :destroy, [Post, Comment]
  end
end
