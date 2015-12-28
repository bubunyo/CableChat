require 'rails_helper'

RSpec.feature "User can create Chat Rooms", type: feature do
  scenario "with valid attributes" do 
    visit "/"

    fill_in "user_username", with: 'Username'
    fill_in "room_name", with: "Room 1"
    click_button "Enter Room"

    expect(page).to have_content "Room 1 Chat Room created!"
  end
end
