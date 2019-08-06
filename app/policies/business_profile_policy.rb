class BusinessProfilePolicy < ApplicationPolicy
  attr_reader :user, :business_profile

  def initialize(user, business_profile)
    @user = user
    @business_profile = business_profile
  end

  def image_delete?
    business_profile.user == user
  end
end
