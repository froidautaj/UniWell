# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    if user.is_a?(SuperUser)
      can :manage, Post
      can :manage, Comment
      can :index, Support
      can :destroy, Support
    else
      # can :manage, Post, user: user
      can :show, [Post, Comment]
      can :show, Comment, user: user
      can :edit, [Post, Comment], user: user
      can :update, [Post, Comment], user: user
      can :destroy, [Post, Comment], user: user
      can :create, [Post, Comment]
      can :mark_as_accepted_comment, Post, user: user
    end

    can :create, Support
    can :destroy, Notification, user: user
    can :read, Notification, user: user
    can :mark_as_read, Notification, user: user
  end
end
