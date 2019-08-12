module DashboardsHelper
  def check_membership(profile)
    if profile.membership
      if profile.membership.end_date >= Date.today
        return true
      end
    end
    false
  end
end
