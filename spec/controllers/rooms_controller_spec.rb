require 'rails_helper'

RSpec.describe RoomsController, :type => :controller do

  describe "GET enter" do
    it "returns http success" do
      get :enter
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET leave" do
  #   it "returns http success" do
  #     get :leave
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
