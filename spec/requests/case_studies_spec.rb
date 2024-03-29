require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/case_studies", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # CaseStudy. As you add validations to CaseStudy, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      CaseStudy.create! valid_attributes
      get case_studies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      case_study = CaseStudy.create! valid_attributes
      get case_study_url(case_study)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_case_study_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      case_study = CaseStudy.create! valid_attributes
      get edit_case_study_url(case_study)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CaseStudy" do
        expect {
          post case_studies_url, params: { case_study: valid_attributes }
        }.to change(CaseStudy, :count).by(1)
      end

      it "redirects to the created case_study" do
        post case_studies_url, params: { case_study: valid_attributes }
        expect(response).to redirect_to(case_study_url(CaseStudy.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CaseStudy" do
        expect {
          post case_studies_url, params: { case_study: invalid_attributes }
        }.to change(CaseStudy, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post case_studies_url, params: { case_study: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested case_study" do
        case_study = CaseStudy.create! valid_attributes
        patch case_study_url(case_study), params: { case_study: new_attributes }
        case_study.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the case_study" do
        case_study = CaseStudy.create! valid_attributes
        patch case_study_url(case_study), params: { case_study: new_attributes }
        case_study.reload
        expect(response).to redirect_to(case_study_url(case_study))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        case_study = CaseStudy.create! valid_attributes
        patch case_study_url(case_study), params: { case_study: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested case_study" do
      case_study = CaseStudy.create! valid_attributes
      expect {
        delete case_study_url(case_study)
      }.to change(CaseStudy, :count).by(-1)
    end

    it "redirects to the case_studies list" do
      case_study = CaseStudy.create! valid_attributes
      delete case_study_url(case_study)
      expect(response).to redirect_to(case_studies_url)
    end
  end
end
