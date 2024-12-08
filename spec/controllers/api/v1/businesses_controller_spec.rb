require 'rails_helper'

RSpec.describe Api::V1::BusinessesController, type: :controller do
  let(:user) { create(:user) }
  let(:api_key) { create(:api_key, user: user) }
  let(:business) { create(:business, created_by_user: user) }
  let(:valid_attributes) { { name: "Test Business", description: "Test Description" } }
  let(:invalid_attributes) { { name: "" } }

  before do
    # Set up authorization header
    request.headers["Authorization"] = "Bearer #{api_key.key}"
  end

  describe "GET #index" do
    context "with proper permissions" do
      before do
        role = create(:security_role)
        permission = create(:security_permission, name: "businesses.list")
        create(:security_role_permission, security_role: role, security_permission: permission)
        create(:user_role_assignment, user: user, security_role: role)
      end

      it "returns a successful response" do
        get :index
        expect(response).to be_successful
      end

      it "returns all businesses" do
        businesses = create_list(:business, 3, created_by_user: user)
        get :index
        json_response = JSON.parse(response.body)
        expect(json_response["data"].length).to eq(3)
      end
    end

    context "without proper permissions" do
      it "returns unauthorized" do
        get :index
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "GET #show" do
    context "with proper permissions" do
      before do
        role = create(:security_role)
        permission = create(:security_permission, name: "businesses.view")
        create(:security_role_permission, security_role: role, security_permission: permission)
        create(:user_role_assignment, user: user, security_role: role)
      end

      it "returns a successful response" do
        get :show, params: { id: business.uuid }
        expect(response).to be_successful
      end

      it "returns the requested business" do
        get :show, params: { id: business.uuid }
        json_response = JSON.parse(response.body)
        expect(json_response["data"]["id"]).to eq(business.uuid)
      end
    end

    context "without proper permissions" do
      it "returns forbidden" do
        get :show, params: { id: business.uuid }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "POST #create" do
    context "with proper permissions" do
      before do
        role = create(:security_role)
        permission = create(:security_permission, name: "businesses.create")
        create(:security_role_permission, security_role: role, security_permission: permission)
        create(:user_role_assignment, user: user, security_role: role)
      end

      context "with valid params" do
        it "creates a new Business" do
          expect {
            post :create, params: { business: valid_attributes }
          }.to change(Business, :count).by(1)
        end

        it "returns a created status" do
          post :create, params: { business: valid_attributes }
          expect(response).to have_http_status(:created)
        end

        it "sets the created_by_user" do
          post :create, params: { business: valid_attributes }
          expect(Business.last.created_by_user).to eq(user)
        end
      end

      context "with invalid params" do
        it "returns unprocessable entity status" do
          post :create, params: { business: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "without proper permissions" do
      it "returns forbidden" do
        post :create, params: { business: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "PUT #update" do
    context "with proper permissions" do
      before do
        role = create(:security_role)
        permission = create(:security_permission, name: "businesses.update")
        create(:security_role_permission, security_role: role, security_permission: permission)
        create(:user_role_assignment, user: user, security_role: role)
      end

      context "with valid params" do
        let(:new_attributes) { { name: "Updated Name" } }

        it "updates the requested business" do
          put :update, params: { id: business.uuid, business: new_attributes }
          business.reload
          expect(business.name).to eq("Updated Name")
        end

        it "returns a success response" do
          put :update, params: { id: business.uuid, business: new_attributes }
          expect(response).to be_successful
        end
      end

      context "with invalid params" do
        it "returns unprocessable entity status" do
          put :update, params: { id: business.uuid, business: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "without proper permissions" do
      it "returns forbidden" do
        put :update, params: { id: business.uuid, business: valid_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "DELETE #destroy" do
    context "with proper permissions" do
      before do
        role = create(:security_role)
        permission = create(:security_permission, name: "businesses.delete")
        create(:security_role_permission, security_role: role, security_permission: permission)
        create(:user_role_assignment, user: user, security_role: role)
      end

      it "destroys the requested business" do
        business # Create the business
        expect {
          delete :destroy, params: { id: business.uuid }
        }.to change(Business, :count).by(-1)
      end

      it "returns no content status" do
        delete :destroy, params: { id: business.uuid }
        expect(response).to have_http_status(:no_content)
      end
    end

    context "without proper permissions" do
      it "returns forbidden" do
        delete :destroy, params: { id: business.uuid }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
