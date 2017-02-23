require 'rails_helper'

  describe "User can create an account" do
    context "when they click on create account" do
      scenario "and fill in all necessary fields" do

        visit login_path
        click_on "Create Account"
        expect(current_path).to eq new_user_path

        fill_in "user[first_name]", with: "John"
        fill_in "user[last_name]", with: "Doe"
        fill_in "user[email]", with: "johndoe@gmail.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "Create User"

        expect(page).to have_content "Welcome John"
        expect(page).to have_content "Your Profile"
        expect(current_path).to eq '/dashboard'

      end
    end

    context "when they click on create account" do
      scenario "and do NOT fill in all necessary fields" do

        visit login_path
        click_on "Create Account"
        expect(current_path).to eq new_user_path

        fill_in "user[first_name]", with: "John"
        fill_in "user[last_name]", with: "Doe"
        fill_in "user[email]", with: "johndoe@gmail.com"
        fill_in "user[password]", with: "password"
        click_on "Create User"

        expect(page).to have_content "Please check that all fields were filled in correctly."
        expect(current_path).to eq new_user_path
      end
    end

    context "when they click on create account" do
      scenario "and their email address is already registered" do
        user = User.create(
                           first_name: "John",
                           last_name: "Doe",
                           email: "johndoe@gmail.com",
                           password: "password"
                           )
        visit login_path
        click_on "Create Account"
        expect(current_path).to eq new_user_path

        fill_in "user[first_name]", with: "Greg"
        fill_in "user[last_name]", with: "Dushkin"
        fill_in "user[email]", with: "johndoe@gmail.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "Create User"

        expect(page).to have_content "Email already registered with an account!"
        expect(current_path).to eq new_user_path
      end
    end
  end
