require 'rails_helper'
#issue 15 & 16
describe "Admin can log in" do
  context "as an authenticated admin" do
    scenario "and they visit admin dashboard" do
      admin = User.create(
                         first_name: "Samuel",
                         last_name: "McKeen",
                         email: "SamMcKeen@gmail.com",
                         password: "password",
                         role: 1
                         )
      visit root_path

      click_on "Log In"
      expect(current_path).to eq('/login')

      fill_in "session[email]", with: "SamMcKeen@gmail.com"
      fill_in "session[password]", with: "password"
      click_on "Login"

      expect(current_path).to eq('/admin/dashboard')
      expect(page).to have_content "Admin Dashboard"
      expect(admin.role).to eq("admin")

       within("h3.greeting") do
         expect(page).to have_content "Welcome Samuel"
       end
       expect(page).to have_content "Log out"
    end
  end

  context "with INvalid credentials" do
    scenario "they click on log in button" do
      user = User.create(
                        first_name: "John",
                        last_name: "Doe",
                        email: "johndoe@gmail.com",
                        password: "password",
                        role: 0
                        )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit 'admin/dashboard'
       expect(user.role).to eq("default")
       expect(page).to have_content "404"
    end
  end

  context "with NO credentials" do
    scenario "they type admin dashboard into url" do

       visit 'admin/dashboard'
       expect(page).to have_content "404"
    end
  end
end
