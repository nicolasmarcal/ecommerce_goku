
require 'spec_helper'

describe Api::V1::AddressesController, type: :controller do

  describe "authentication" do
    context "when has token" do
      let!(:credentials) { request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(YAML.load_file('config/secrets.yml')[Rails.env]["secret_key_base"]) }
      context "when find address" do
        let(:address){ FactoryGirl.create(:address) }

        it "return success" do
          request.accept = "application/json"
          get 'index', { address: { zip_code: address.zip_code } }

          expect(response.response_code).to eq(200)
        end
      end

      context "when address is not found" do
        it "return 404" do
          request.accept = "application/json"
          get 'index', { address: { zip_code: "BLA" } }

          expect(response.response_code).to eq(404)
        end
      end
    end

    context "when hasn't token" do
      it "return unauthorized" do
        request.accept = "application/json"
        get 'index', { address: { zip_code: "BLA" } }, authorization: nil

        expect(response.response_code).to eq(401)
      end
    end
  end
end