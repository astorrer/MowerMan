require 'rails_helper'

describe AreasController do
  
  describe 'GET #new' do
    it "assigns a new Area to @area"
    it "renders the :new template"
  end
  
  describe 'GET #edit' do
    it "assigns the requested area to @area"
    it "renders the :area template"
  end
  
  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new area in the database"
      it "redirects to libraries#index"
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