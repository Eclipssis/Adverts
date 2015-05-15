class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    guest = Role.find_by_name(:guest)
    user ||= User.new # guest user

    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :read, :all
      can [:create, :update, :destroy], Advert
      can [:create, :update, :destroy], Comment
    elsif user.user?
      can :read, [Advert,Comment]
      can :create, Advert
      can([:update, :destroy], Advert) { |advert| advert.user == user }
      can :create, Comment
      can([:update, :destroy], Comment) { |comment| comment.user == user }
    else
      can :read, [Advert,Comment]
    end
  end
end