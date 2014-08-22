class Ability
  include CanCan::Ability

  def initialize(user)
      # Define abilities for the passed in user here. For example:
      if user.admin?
        can :manage, :all
        can :access, :rails_admin # needed to access RailsAdmin
        can :dashboard            # dashboard access
      else
        can :read, :all
      end
  end
end