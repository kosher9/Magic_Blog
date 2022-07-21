class Ability
  include CanCan::Ability

  def initialize(user)
      return unless user.present?
      can :destroy, :Post
      return unless user.admin?
      can :delete, :Post
  end
end
