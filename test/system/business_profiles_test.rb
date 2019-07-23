require "application_system_test_case"

class BusinessProfilesTest < ApplicationSystemTestCase
  setup do
    @business_profile = business_profiles(:one)
  end

  test "visiting the index" do
    visit business_profiles_url
    assert_selector "h1", text: "Business Profiles"
  end

  test "creating a Business profile" do
    visit business_profiles_url
    click_on "New Business Profile"

    fill_in "Australian business number", with: @business_profile.australian_business_number
    fill_in "Business profile description", with: @business_profile.business_profile_description
    fill_in "Contact", with: @business_profile.contact_id
    click_on "Create Business profile"

    assert_text "Business profile was successfully created"
    click_on "Back"
  end

  test "updating a Business profile" do
    visit business_profiles_url
    click_on "Edit", match: :first

    fill_in "Australian business number", with: @business_profile.australian_business_number
    fill_in "Business profile description", with: @business_profile.business_profile_description
    fill_in "Contact", with: @business_profile.contact_id
    click_on "Update Business profile"

    assert_text "Business profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Business profile" do
    visit business_profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Business profile was successfully destroyed"
  end
end
