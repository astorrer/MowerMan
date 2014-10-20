require 'spec_helper'

describe DashboardController do

  describe "GET 'dash'" do
    it "returns http success" do
      get 'dash'
      response.should be_success
    end
  end

end
