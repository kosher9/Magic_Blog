class Ability
  include CanCan::Ability

  def initialize(user)
    # can :read, [Post, Comment], author: user
    return unless user.present?

    can :destroy, [Post, Comment]
    return unless user.role?

    can :destroy, [Post, Comment]
  end
end
