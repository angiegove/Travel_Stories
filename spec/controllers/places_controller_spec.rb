require 'spec_helper'

describe PlacesController, :type => :controller do

  describe "GET :index" do
    before do
      FactoryGirl.create_list(:place, 5)
    end

    describe "as HTML" do
      before do
        get :index
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the index template" do
        expect(response).to render_template("index")
      end
    end
  end

  describe "GET 'new'" do

    describe "as HTML" do
      before do
        get :new
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "should render the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST create" do

    context "with valid attributes" do
      it "creates a new place" do
        expect{
          post :create, place: FactoryGirl.attributes_for(:place)
        }.to change(Place,:count).by(1)
      end

      it "redirects to the place index" do
        post :create, place: FactoryGirl.attributes_for(:place)
        response.should redirect_to places_path
      end
    end

    context "with invalid attributes" do

      it "does not save the new place" do
        expect{
          post :create, place: FactoryGirl.attributes_for(:invalid_place)
        }.to_not change(Place,:count)
      end

      it "re-renders the new method" do
        post :create, place: FactoryGirl.attributes_for(:invalid_place)
        response.should render_template :new
      end
    end
  end

  describe "GET 'edit'" do
    before do
      @place = FactoryGirl.create(:place)
    end

    describe "as HTML" do
      before do
        get :edit, :id => @place.id
      end

      it "should respond with a status 200" do
        expect(response).to be_success
        expect(response.status).to eq(200)
      end

      it "assigns the requested place to @place" do
        get :edit, :id => @place.id
        assigns(:place).should eq(@place)
      end

      it "should render the edit template" do
        expect(response).to render_template("edit")
      end
    end
  end

  describe "PUT 'update'" do
    before :each do
      @place = FactoryGirl.create(:place)
    end
    context " produces valid attributes" do

      it "located the requested @place" do
        put :update, id: @place, place: FactoryGirl.attributes_for(:place)
        assigns(:place).should eq(@place)
      end

      it "changes @place's attributes" do
        put :update, id: @place, place: FactoryGirl.attributes_for(:place, title: "Some Other Title")
        @place.reload
        @place.title.should eq("Some Other Title")
      end
    end

    context "invalid attributes" do

      it "locates the requested @place" do
        put :update, id: @place, place: FactoryGirl.attributes_for(:invalid_place)
        assigns(:place).should eq(@place)
      end

      it "does not change @place's attributes" do
        put :update, id: @place, place: FactoryGirl.attributes_for(:place, latitude: nil)
        @place.reload
        @place.latitude.should_not eq(nil)
      end

      it "re-renders the edit method" do
        put :update, id: @place, place: FactoryGirl.attributes_for(:invalid_place)
        response.should render_template :edit
      end

    end
  end

  describe 'DELETE destroy' do
    before :each do
      @place = FactoryGirl.create(:place)
    end
    it "deletes the place" do
      expect{
        delete :destroy, id: @place
      }.to change(Place,:count).by(-1)
    end
    it "redirects to places#index" do
      delete :destroy, id: @place
      response.should redirect_to places_path
    end
  end

end
