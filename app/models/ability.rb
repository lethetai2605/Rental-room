# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(account)
    account ||= Account.new

    can :show, Account do |acc|
      acc.id == account.id
    end
    can [:create, :update], Profile do |profile|
      profile.try(:owner) == account
    end

    if account.admin?
      can :access, :rails_admin
      can :dashboard, :main
      can :manage, :all
    elsif account.host?
      can :manage, Room do |room|
        room.try(:owner) == account
      end
      # can :manage, :all
    else
      
    end
  end
end
