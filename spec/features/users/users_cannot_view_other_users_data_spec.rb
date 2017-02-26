require 'rails_helper'

  describe "User cannot view other users data" do
    scenario "when they enter a different user id in browser" do
      user = User.create(
                         first_name: "John",
                         last_name: "Doe",
                         email: "johndoe@gmail.com",
                         password: "password"
                         )
      admin = User.create(
                          first_name: "Samuel",
                          last_name: "McKeen",
                          email: "SamMcKeen@gmail.com",
                          password: "password",
                          role: 1
                          )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit edit_user_path(admin)
      expect(page).to have_xpath("//input[@value='Samuel']")

      visit '/users/2/edit'
      expect(page).to have_xpath("//input[@value='Samuel']")

      visit '/users/3/edit'
      expect(page).to have_xpath("//input[@value='Samuel']")

    end
  end
