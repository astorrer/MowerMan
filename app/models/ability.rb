class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :manager
      can :read, :all
      can :manage, Plantask
      can :manage, Area
      can :manage, Equipment
      can :manage, Part
      can :manage, TaskMethod
      can :manage, WorkOrder
      can :update, EggTimer
    else
      can :read, :all
      can :update, Plantask
      can :update, WorkOrder
    end
  end
end
