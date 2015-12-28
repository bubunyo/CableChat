require 'rails_helper'

RSpec.feature "User can create Chat Rooms" do
  scenario "with valid attributes" do 
    visit "/"
    fill_in "Username", with: 'Username'
    fill_in "Chat ROom", with: "Room 1"
    click_button "Enter Room"

    expect(page).to have_content "Room 1 Chat Room created!"
  end
end
