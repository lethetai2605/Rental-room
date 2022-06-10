# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(account)
    account ||= Account.new

    can :show, Account do |acc|
      acc.id == account.id
    end
    can %i[create update], Profile

    if account.admin?
      can :access, :rails_admin
      can :dashboard, :main
      can :manage, :all
    elsif account.host?
      can :create, Room
      can :manage, Room do |room|
        room.try(:owner) == account
      end
    elsif account.guest?
      can :read, Room
    end
  end
end
