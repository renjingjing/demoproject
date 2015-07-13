class Ability
  include CanCan::Ability

   def initialize(user)
    user ||= User.new
    can :create, Review do |review|
      review.user == user
    end
    can :destroy, Review do |review|
      review.user == user
    end
  end
end
