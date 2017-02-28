require 'rails_helper'

describe "Admin can create an item" do
  scenario "when they visit the admin dashboard" do
    admin = User.create(
                       first_name: "Samuel",
                       last_name: "McKeen",
                       email: "SamMcKeen@gmail.com",
                       password: "password",
                       role: 1
                       )
    category_1 = Category.create(title: "Pogs")
    category_2 = Category.create(title: "Slammers")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    # visit 'admin/dashboard'
    # click_on "Create an item"
    visit new_admin_item_path
    # expect(path). to eq new_admin_item_path
    select "Pogs", from: "item[category_id]"
    fill_in "item[title]", with: "NFL Pack"
    fill_in "item[description]", with: "Includes all your favorite teams like the Houston Oilers, LA Raiders, St. Louis Rams"
    fill_in "item[image_path]", with: "http://i.imgur.com/1SzimX8.jpg"
    fill_in "item[price]", with: 12.73
    # select "active", from: "status[item_id]"
    click_button "Create Item"
    expect(page).to have_content "NFL Pack"
    expect(page).to have_content "Pogs"
    expect(page).to have_content "Includes all your favorite teams like the Houston Oilers, LA Raiders, St. Louis Rams"
  end
end
