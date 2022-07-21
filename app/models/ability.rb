class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Post, author: user
    return unless user.present?
    can :destroy, :Post
    return unless user.admin?
    can :destroy, :Post
  end
end
