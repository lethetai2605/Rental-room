# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(account)
    account ||= Account.new
    if account.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end
end