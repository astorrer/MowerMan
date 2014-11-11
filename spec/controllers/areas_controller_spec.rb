require 'spec_helper'

describe AreasController do
  describe 'administrator access' do
    before :each do
      user = create(:admin)
      sign_in user 
    end

    describe 'GET #new' do
      it "assigns a new Area to @area" do
        get :new
        expect(assigns(:area)).to be_a_new(Area)
      end
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      it "assigns the requested area to @area" do
        area = create(:area)
        get :edit, id: area
        expect(assigns(:area)).to eq area
      end
      it "renders the :area template" do
        area = create(:area)
        get :edit, id: area
        expect(area).to render_template :edit
      end
    end

    describe 'POST #create' do
      context "with valid attributes" do
        it "saves the new area in the database" do
          expect {
            post :create, area: attributes_for(:area)
          }.to change(Area, :count).by(1)
        end
        it "redirects to libraries#index" do
          post :create, area: attributes_for(:area)
          expect(response).to redirect_to libraries_path(assigns[:area])
        end
      end
      context "with invalid attributes" do
        it "does not save the new area in the database"
        it "re-renders the :new template"
      end
    end
  
    describe 'PATCH #update' do
      context "with valid attributes" do
      end
      context "with invalid attributes" do
      end
    end
  
    describe 'DELETE #destroy' do
      it "deletes the area from the database"
      it "redirects to libraries#index"
    end
  end
end