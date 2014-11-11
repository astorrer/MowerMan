require 'spec_helper'

describe LibrariesController do
  
  describe 'GET #index' do
    it 'renders the :index template' do
      get :library
      expect(response).to render_template :index
    end
  end

end