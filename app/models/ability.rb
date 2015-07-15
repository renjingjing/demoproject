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
    #
     can :manage, Product do |product|
      product.user == user
      #  product.user == admin_user
     end
    #
    # can :publish, Product do |product|
    #   product.may_publish? && product.user == admin_user
    # end
   end
end
