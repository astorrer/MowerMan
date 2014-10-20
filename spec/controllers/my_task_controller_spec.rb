require 'spec_helper'

describe MyTaskController do

  describe "GET 'mytasks'" do
    it "returns http success" do
      get 'mytasks'
      response.should be_success
    end
  end

end
