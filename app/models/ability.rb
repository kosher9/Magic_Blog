class Ability
  include CanCan::Ability

  def initialize(_user)
    # can :read, [Post, Comment], author: user
    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all
    else
      can :manage, Post, author: user
      can :manage, Comment, author: user
      can :read, :all
    end
  end
end
