# class BusinessProfilePolicy < ApplicationPolicy
#   attr_reader :user, :membership

#   def initialize(user, membership)
#     @user = user
#     @membership = membership
#   end

#   def new?
#     business_profile.user == user
#   end

#   def index?
#     false
#   end

#   def show?
#     false
#   end

#   def create?
#     false
#   end

#   def new?
#     create?
#   end

#   def update?
#     false
#   end

#   def edit?
#     update?
#   end

#   def destroy?
#     false
#   end
# end
